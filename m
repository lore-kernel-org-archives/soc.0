Return-Path: <robh@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE716C433FE
	for <soc@archiver.kernel.org>; Fri, 22 Oct 2021 14:07:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id A29E561037; Fri, 22 Oct 2021 14:07:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8ACBA60FC4;
	Fri, 22 Oct 2021 14:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634911659;
	bh=u5uH9jGiutWTE/Eu97Mn7sAtTbTmAcKcqnaUojHkoKk=;
	h=References:In-Reply-To:From:Date:Subject:List-Id:To:Cc:From;
	b=OW2E5+QMx15Df3HDZlXGOBZpeQII0I7eVRkaiuPzgNqoP6dNWNI2OZGwQRkxrliv+
	 niF/70uw2gtpJ7YDrcKfAxYO9aCxXJ2shVoGeQmL6rQqoH5RTRX/xPa7169ib3zjfF
	 dDQtYEU7OuMeN5EX9sHdWpvc+Bnw6wwxDyUHQGY4KX68iYiXOnlCwfc0Nbeg6R/OSg
	 A6hwtCZzDhsONnbSJ9XbXUqFJZwJ20S7iiGivm0VNTD0K8S4CkHC+FikdrqpYYWz19
	 5rmENM6PG7Z9PYpKAF87TxPHacg+vDOGOCb8ciqMjrWEpk9nTCbWlfpO4Z802A5JGg
	 5rxEq0JWMcuZg==
Received: by mail-ed1-f50.google.com with SMTP id w19so2065569edd.2;
        Fri, 22 Oct 2021 07:07:39 -0700 (PDT)
X-Gm-Message-State: AOAM5332V9lvGQAy5GxqW3xGS+nXfc8PwGLGw6whMUw0Bsoe32VUh5Es
	lEgty8MvEAr0nbi+fD6+oJXdL9OiLkErYHomxg==
X-Google-Smtp-Source: ABdhPJw4GIcdkSxeHvtX90EduWuq35zgP6j/V0Qs8+xKOiNZXSvMuTKRkAnP+P77GK8ZBydz7A7plaV3peuK+70+Jj0=
X-Received: by 2002:a17:906:6a1d:: with SMTP id qw29mr15601416ejc.147.1634911651559;
 Fri, 22 Oct 2021 07:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210928192143.1841497-1-robh@kernel.org> <20211004061406.tyhldt4f26zilaaw@vireshk-i7>
 <CAL_JsqJzb3mOO-0_y+7zOQO6DMNLhAN99pDfuj55ooLULKb4WA@mail.gmail.com> <20211022043512.ojuz2eqwf5xgndph@vireshk-i7>
In-Reply-To: <20211022043512.ojuz2eqwf5xgndph@vireshk-i7>
From: Rob Herring <robh@kernel.org>
Date: Fri, 22 Oct 2021 09:07:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJo+908vDTMVKOT5T66+UzyH_t78ebk7+Ew0gGqbnF=SQ@mail.gmail.com>
Message-ID: <CAL_JsqJo+908vDTMVKOT5T66+UzyH_t78ebk7+Ew0gGqbnF=SQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: spear13xx: Drop malformed 'interrupt-map' on
 PCI nodes
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, SoC Team <soc@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 21, 2021 at 11:35 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 21-10-21, 16:12, Rob Herring wrote:
> > On Mon, Oct 4, 2021 at 1:14 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > On 28-09-21, 14:21, Rob Herring wrote:
> > > > The spear13xx PCI 'interrupt-map' property is not parse-able.
> > > > '#interrupt-cells' is missing and there are 3 #address-cells. Based on the
> > > > driver, the only supported interrupt is for MSI. Therefore, 'interrupt-map'
> > > > is not needed.
> > > >
> > > > Cc: Viresh Kumar <vireshk@kernel.org>
> > > > Cc: Shiraz Hashim <shiraz.linux.kernel@gmail.com>
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > >  arch/arm/boot/dts/spear1310.dtsi | 6 ------
> > > >  arch/arm/boot/dts/spear1340.dtsi | 2 --
> > > >  2 files changed, 8 deletions(-)
> > > >
> > > > diff --git a/arch/arm/boot/dts/spear1310.dtsi b/arch/arm/boot/dts/spear1310.dtsi
> > > > index c4b49baf9804..2f746a9428a7 100644
> > > > --- a/arch/arm/boot/dts/spear1310.dtsi
> > > > +++ b/arch/arm/boot/dts/spear1310.dtsi
> > > > @@ -82,8 +82,6 @@ pcie0: pcie@b1000000 {
> > > >                       reg = <0xb1000000 0x4000>, <0x80000000 0x20000>;
> > > >                       reg-names = "dbi", "config";
> > > >                       interrupts = <0 68 0x4>;
> > > > -                     interrupt-map-mask = <0 0 0 0>;
> > > > -                     interrupt-map = <0x0 0 &gic 0 68 0x4>;
> > > >                       num-lanes = <1>;
> > > >                       phys = <&miphy0 1>;
> > > >                       phy-names = "pcie-phy";
> > > > @@ -101,8 +99,6 @@ pcie1: pcie@b1800000 {
> > > >                       reg = <0xb1800000 0x4000>, <0x90000000 0x20000>;
> > > >                       reg-names = "dbi", "config";
> > > >                       interrupts = <0 69 0x4>;
> > > > -                     interrupt-map-mask = <0 0 0 0>;
> > > > -                     interrupt-map = <0x0 0 &gic 0 69 0x4>;
> > > >                       num-lanes = <1>;
> > > >                       phys = <&miphy1 1>;
> > > >                       phy-names = "pcie-phy";
> > > > @@ -120,8 +116,6 @@ pcie2: pcie@b4000000 {
> > > >                       reg = <0xb4000000 0x4000>, <0xc0000000 0x20000>;
> > > >                       reg-names = "dbi", "config";
> > > >                       interrupts = <0 70 0x4>;
> > > > -                     interrupt-map-mask = <0 0 0 0>;
> > > > -                     interrupt-map = <0x0 0 &gic 0 70 0x4>;
> > > >                       num-lanes = <1>;
> > > >                       phys = <&miphy2 1>;
> > > >                       phy-names = "pcie-phy";
> > > > diff --git a/arch/arm/boot/dts/spear1340.dtsi b/arch/arm/boot/dts/spear1340.dtsi
> > > > index 1a8f5e8b10e3..827e887afbda 100644
> > > > --- a/arch/arm/boot/dts/spear1340.dtsi
> > > > +++ b/arch/arm/boot/dts/spear1340.dtsi
> > > > @@ -47,8 +47,6 @@ pcie0: pcie@b1000000 {
> > > >                       reg = <0xb1000000 0x4000>, <0x80000000 0x20000>;
> > > >                       reg-names = "dbi", "config";
> > > >                       interrupts = <0 68 0x4>;
> > > > -                     interrupt-map-mask = <0 0 0 0>;
> > > > -                     interrupt-map = <0x0 0 &gic 0 68 0x4>;
> > > >                       num-lanes = <1>;
> > > >                       phys = <&miphy0 1>;
> > > >                       phy-names = "pcie-phy";
> > >
> > > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> >
> > Are you going to apply this?
>
> No, you or Arnd can directly apply it. I don't send pull requests for SPEAr
> anymore due to very low traffic.

Sigh. Where is this tribal knowledge documented?

soc@kernel.org should be listed in the MAINTAINERS entry if that is
the case (yes, I know they don't want to be).

Rob
