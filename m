Return-Path: <SRS0=KCR3=CJ=collabora.com=sebastian.reichel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCE8EB64D7
	for <soc@archiver.kernel.org>; Wed, 21 Jun 2023 13:53:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 53829C433CA; Wed, 21 Jun 2023 13:53:06 +0000 (UTC)
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8EAD9C433C8;
	Wed, 21 Jun 2023 13:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8EAD9C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collabora.com
Received: from mercury (dyndsl-091-248-190-194.ewe-ip-backbone.de [91.248.190.194])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 90AEE6603219;
	Wed, 21 Jun 2023 14:53:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1687355582;
	bh=SY03hCxQpp3Ebdy4ngbQuT5wShjDgQyR6baztM+EO/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zh8VBv/QCLFUT+2QL6NjJzvk2b4Uk0GA2+z3nLGhg+VfiTpjCgctxTHR8sFJfDmuZ
	 cL979M9iM2vMTde8S3RXafuNVqCzM15CNfedj6W+Ue6kUFAaF/Dc1FY22hVcq0uzML
	 7fqiCKowOH+qmhRf0u2C3bC95L5B10xhWrM1GBsyO7x+Jrg2D6gueD7FVhboJ4utVG
	 k/ykNZgihRCTLkkEu8UPtXrNjce7aHEIM14F8Dj3W8GF6LrIDrr1+lkN/HN5CwLxky
	 jHpqRdloQjs5nRhBSGkb8hL5rlSYgYXjmuGUmh7F0fnL/bztR3Rpv33g+vfwPvwwEW
	 BGfLsEU3EnhEg==
Received: by mercury (Postfix, from userid 1000)
	id AAEA61060E74; Wed, 21 Jun 2023 15:52:59 +0200 (CEST)
Date: Wed, 21 Jun 2023 15:52:59 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Arnd Bergmann <arnd@arndb.de>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, arm <arm@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kernel@lists.collabora.com,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [GIT PULL] ARM64 RK808 defconfig fix
Message-ID: <20230621135259.eibuvjnavucvkq2z@mercury.elektranox.org>
References: <20230615174940.jmzuv5kb6o7htkwo@mercury.elektranox.org>
 <5dd55b3f-9a12-4c3e-99a8-b81add924cbb@app.fastmail.com>
 <20230621122854.yvffeuhhp4ywqcla@mercury.elektranox.org>
 <83094b7e-5298-4d9d-9eab-8af979c3f710@app.fastmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3ufydso3rbbm347x"
Content-Disposition: inline
In-Reply-To: <83094b7e-5298-4d9d-9eab-8af979c3f710@app.fastmail.com>


--3ufydso3rbbm347x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 21, 2023 at 03:10:46PM +0200, Arnd Bergmann wrote:
> On Wed, Jun 21, 2023, at 14:28, Sebastian Reichel wrote:
> > On Wed, Jun 21, 2023 at 11:36:48AM +0200, Arnd Bergmann wrote:
> >> On Thu, Jun 15, 2023, at 19:49, Sebastian Reichel wrote:
> >> > Since I did not get any feedback for the defconfig patches from [0] =
and they
> >> > are fixing a KernelCI regression (Rockchip Chromebooks no longer boo=
t because
> >> > of missing PMIC driver), I prepared a pull request with the defconfi=
g change
> >> > instead as suggested by Tony [1]. It consists of the rk806 immutable=
 branch
> >> > prepared by Lee Jones [2] and the arm64 defconfig patch. I will send=
 a second
> >> > pull request for the arm32 multi_v7 defconfig. This is targeting lin=
ux-next.
> >> >
> >> > [0]=20
> >> > https://lore.kernel.org/all/20230518040541.299189-1-sebastian.reiche=
l@collabora.com/
> >> > [1]=20
> >> > https://lore.kernel.org/linux-omap/20230604060436.GT14287@atomide.co=
m/
> >> > [1] https://lore.kernel.org/all/20230515152425.GV10825@google.com/
> >>=20
> >> I don't think it's important to have bisectable defconfig changes,
> >> and I'd prefer to just cherry-pick the two defconfig patches in
> >> this case if that's ok with you.
> >
> > Sure, please go ahead. I just want to make sure that the regression
> > is fixed.
>=20
> Done

Thanks.

> > By the way, what's the merge strategy for defconfig patches? Apart
> > from my RK808 fixes we have some other pending defconfig updates and
> > nobody seems to care:
> >
> > https://lore.kernel.org/all/20230504201916.1121243-1-cristian.ciocaltea=
@collabora.com/
> > https://lore.kernel.org/all/20230604171345.1215276-1-cristian.ciocaltea=
@collabora.com/
>=20
> I normally expect defconfig patches to go through one of the platform
> maintainer trees, the same way that I merge dts or driver changes,
> so I tend to miss patches sent individually, unless they take soc@kernel.=
org
> into Cc, which puts them into patchwork.

Ok. So maybe something like this could be applied to MAINTAINERS?

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e0b87d5aa2e..63e7105a7f59 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3069,6 +3069,13 @@ F:       Documentation/arm64/
 F:     arch/arm64/
 F:     tools/testing/selftests/arm64/
 X:     arch/arm64/boot/dts/
+X:     arch/arm64/configs/defconfig
+
+ARM64 DEFCONFIG
+M:     ARM64 subsystem maintainers (e.g. Qualcomm, Mediatek, ...) <invalid=
@invalid>
+L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:     Maintained
+F:     arch/arm64/configs/defconfig
=20
 ARROW SPEEDCHIPS XRS7000 SERIES ETHERNET SWITCH DRIVER
 M:     George McCollister <george.mccollister@gmail.com>

This changes get_maintainers output from

$ ./scripts/get_maintainer.pl -f arch/arm64/configs/defconfig
Catalin Marinas <catalin.marinas@arm.com> (maintainer:ARM64 PORT (AARCH64 A=
RCHITECTURE))
Will Deacon <will@kernel.org> (maintainer:ARM64 PORT (AARCH64 ARCHITECTURE))
Bjorn Andersson <quic_bjorande@quicinc.com> (commit_signer:39/96=3D41%)
Arnd Bergmann <arnd@arndb.de> (commit_signer:21/96=3D22%,added_lines:60/287=
=3D21%,removed_lines:60/87=3D69%)
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> (commit_signer:13/96=
=3D14%,authored:6/96=3D6%,added_lines:22/287=3D8%)
Geert Uytterhoeven <geert+renesas@glider.be> (commit_signer:11/96=3D11%)
Konrad Dybcio <konrad.dybcio@linaro.org> (commit_signer:9/96=3D9%)
Neil Armstrong <neil.armstrong@linaro.org> (authored:5/96=3D5%)
"N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com> (added_lines:43/287=
=3D15%)
Mark Brown <broonie@kernel.org> (added_lines:16/287=3D6%)
"Rafa=C5=82 Mi=C5=82ecki" <rafal@milecki.pl> (removed_lines:5/87=3D6%)
linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 AR=
CHITECTURE))
linux-kernel@vger.kernel.org (open list)

to

$ ./scripts/get_maintainer.pl -f arch/arm64/configs/defconfig
"ARM64 subsystem maintainers (e.g. Qualcomm, Mediatek, ...)" <invalid@inval=
id> (maintainer:ARM64 DEFCONFIG)
linux-arm-kernel@lists.infradead.org (moderated list:ARM64 DEFCONFIG)
linux-kernel@vger.kernel.org (open list)

That should make it a bit more obvious, what to do.

> I've applied the above two now, as they seem harmless. I see that
> Heiko was not on Cc here, so he probably never saw them.

Thanks.

> >> > The following changes since commit ac9a78681b921877518763ba0e8920225=
4349d1b:
> >> >
> >> >   Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)
> >> >
> >> > are available in the Git repository at:
> >> >
> >> >  =20
> >> > ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/sre/linux-mis=
c.git/=20
> >> > rk806-defconfig-fix-arm64
> >>=20
> >> This is also not a public git URL, you may need something like this
> >> in your .gitconfig to generate better pull requests:
> >>=20
> >> [url "https://git.kernel.org"]
> >>     insteadOf =3D ssh://git@gitolite.ra.kernel.org
> >
> > oops, I actually have the reverse thing in my .gitconfig and didn't
> > notice it gets applied for 'git request-pull'. Thanks for the hint.
>=20
> For the reverse entry, you probably want this:
>=20
> [url "git+ssh://gitolite@ra.kernel.org"]
>     pushInsteadOf =3D git://git.kernel.org
>=20
> so that "git request-pull" always uses the https but "git push"
> always uses git+ssh, regardless of what URL you have.

Thanks, that seems to work.

Greetings,

-- Sebastian

--3ufydso3rbbm347x
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmSTAKoACgkQ2O7X88g7
+pq2CxAAjYn6qkzIrXDmwlU0JioegNlsSZZNg+oVOvqosOLAOk+5wgrIWIUBEZ85
OyE32MC200+EbaNGfLfvTUVMVnMoazyuIrpxyhpIr+lqzSRfUwhH2ut7on0utvU2
U3BueEhwKTYDmFVE75iIM77lxkqbmz7JWFb4Fr/9ZwZ6ugFCimJ1vbd+oAyAIzkm
t3OCbA9EK5HU8Gu4bcKlC2GvpyPWzrjW7naVlK/DvAtiTVhBs13GBigXcXth92+C
01Uxx1B5ff0mQPTS/9cWuMKQFRQ3GHDgI9HeKFMYoxsazB1Pmn/eygSsheru5uWb
GQnOAauOUmQuPFrsiHsjyEl/cD7R5pO8FLpw8g+D5LlvMA4BMapYhOrNXi6NNTxB
4JUcjsGZuFWSBBmDJkyd8sR5rdIm8BMfoO+h0af74/BBovhRI7O7eGYVbB1xBaOw
xHGEcK+u9chMJOLGnLwW7COM/6rq2mbKyl38ETyfPD5YCwnuDMVevgknxlZnwTSB
cxzr6YUEMLHGeqe4sY4iQKDnrv4bzm8mu+TDglopTSuVcrAipt8HiWLrrlFgW300
iRo2BqlMAYuJ2YIFpYCTP/Bgn/QVErI1ZpdnupIeWBd0aeE/G9Z97nAxrCILN3Xy
hR8syMI2e73jxnGozAUs0Ud3gKZ8LZFd5VCH7vp0TmCBbjPlbV0=
=CCxi
-----END PGP SIGNATURE-----

--3ufydso3rbbm347x--
