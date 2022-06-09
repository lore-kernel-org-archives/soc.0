Return-Path: <SRS0=LLBv=WQ=sntech.de=heiko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF79DC43334
	for <soc@archiver.kernel.org>; Thu,  9 Jun 2022 14:57:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C12F9C3411B; Thu,  9 Jun 2022 14:57:02 +0000 (UTC)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D444EC34114;
	Thu,  9 Jun 2022 14:57:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D444EC34114
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1nzJad-0006x1-AP; Thu, 09 Jun 2022 16:56:51 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Maya Matuszczyk <maccraft123mc@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree <devicetree@vger.kernel.org>, arm-mail-list <linux-arm-kernel@lists.infradead.org>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 32/48] arm64: dts: rockchip: align gpio-key node names with dtschema
Date: Thu, 09 Jun 2022 16:56:50 +0200
Message-ID: <2126178.C4sosBPzcN@diego>
In-Reply-To: <e0f7146d-3ccc-a194-bb1e-c3475ca8c29e@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org> <CAO_MupKxvaXRQvMyEUZMThBZ9033OeJec+BtBndjs5oZ3etTEQ@mail.gmail.com> <e0f7146d-3ccc-a194-bb1e-c3475ca8c29e@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"

Am Donnerstag, 9. Juni 2022, 16:15:25 CEST schrieb Krzysztof Kozlowski:
> On 09/06/2022 15:57, Maya Matuszczyk wrote:
> > czw., 9 cze 2022 o 13:56 Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> napisa=C5=82(a):
> >>
> >> The node names should be generic and DT schema expects certain pattern
> >> (e.g. with key/button/switch).
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  arch/arm64/boot/dts/rockchip/rk3308-evb.dts   |  2 +-
> >>  .../boot/dts/rockchip/rk3326-odroid-go2.dts   | 32 +++++++++----------
> >>  .../boot/dts/rockchip/rk3328-nanopi-r2s.dts   |  2 +-
> >>  arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi  |  2 +-
> >>  .../boot/dts/rockchip/rk3368-geekbox.dts      |  2 +-
> >>  .../dts/rockchip/rk3368-orion-r68-meta.dts    |  2 +-
> >>  .../boot/dts/rockchip/rk3368-px5-evb.dts      |  2 +-
> >>  arch/arm64/boot/dts/rockchip/rk3368-r88.dts   |  2 +-
> >>  .../boot/dts/rockchip/rk3399-firefly.dts      |  2 +-
> >>  .../dts/rockchip/rk3399-gru-chromebook.dtsi   |  2 +-
> >>  .../boot/dts/rockchip/rk3399-gru-kevin.dts    |  2 +-
> >>  .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi |  2 +-
> >>  .../boot/dts/rockchip/rk3399-khadas-edge.dtsi |  2 +-
> >>  .../boot/dts/rockchip/rk3399-nanopi-r4s.dts   |  4 +--
> >>  .../boot/dts/rockchip/rk3399-nanopi4.dtsi     |  2 +-
> >>  .../boot/dts/rockchip/rk3399-orangepi.dts     |  2 +-
> >>  .../boot/dts/rockchip/rk3399-pinebook-pro.dts |  4 +--
> >>  .../boot/dts/rockchip/rk3399-roc-pc.dtsi      |  2 +-
> >>  .../boot/dts/rockchip/rk3399-rockpro64.dtsi   |  2 +-
> >>  .../boot/dts/rockchip/rk3399-sapphire.dtsi    |  2 +-
> >>  .../boot/dts/rockchip/rk3566-pinenote.dtsi    |  2 +-
> >>  21 files changed, 38 insertions(+), 38 deletions(-)
> >>
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3308-evb.dts b/arch/arm64/=
boot/dts/rockchip/rk3308-evb.dts
> >> index 9b4f855ea5d4..4b5413b12bfa 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3308-evb.dts
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3308-evb.dts
> >> @@ -75,7 +75,7 @@ gpio-keys {
> >>                 pinctrl-names =3D "default";
> >>                 pinctrl-0 =3D <&pwr_key>;
> >>
> >> -               power {
> >> +               power-key {

hmm, it looks like all the others below are named key-power, while
only this uses power-key ?


> >>                         gpios =3D <&gpio0 RK_PA6 GPIO_ACTIVE_LOW>;
> >>                         linux,code =3D <KEY_POWER>;
> >>                         label =3D "GPIO Key Power";
> >> diff --git a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts b/arch=
/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> >> index ea0695b51ecd..72328dd993ee 100644
> >> --- a/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> >> +++ b/arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dts
> >> @@ -71,82 +71,82 @@ gpio-keys {
> >>                  * |------------------------------------------------|
> >>                  */
> >>
> >> -               sw1 {
> >> +               switch-1 {
> > Wouldn't it make more sense to rename this and all other
> > renamed nodes in this dts into "button-dpad-up" or "button-1",
> > as on the physical device those are buttons and the naming
> > scheme of "sw" + number seems to be a carryover from
> > downstream sources.

The naming actually carries over from the device itself.
In the schematics the relevant keys are also named sw1, sw2, etc.

And I do believe it is way nicer when devicetree names correspond to the
things you find in device schematics and not be named "arbitarily" to
only conform to some schema ;-)

So personally I'd actually prefer going with switch-sw1 (or button-sw1 if
you prefer) as being able to just use the search function in schematic pdfs
is a helpful tool.


Heiko

> Can be buttons. I assumed SW comes from some kind of switch.
> I assume you mean only this Odroid Go2 DTS, because some other DTSes
> (like EVB above) explicitly call it "Key Power".
>=20
>=20
> Best regards,
> Krzysztof
>=20




