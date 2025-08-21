import { css } from '@emotion/react';

interface TProps {
  className?: any;
  children?: any;
}

const MBLoginBg = ({ className }: TProps) => {
  return (
    <div css={MBLoginBgCss} className={className}>
      MBLoginBg
    </div>
  );
};

const MBLoginBgCss = css({});
export default MBLoginBg;
