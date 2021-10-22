Return-Path: <SRS0=AiQL=PK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC85C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 14:11:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6AD461213
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Oct 2021 14:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6AD461213
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xx6uxbZoG5Mh4iJUh3erfjT48xLYM7IQMquFYiJUgw4=; b=UApHDidULqefCa
	doKJh8v47o7H2tTyu088IAAkE5XhpyaD5yqUGeq6Ibn1SOT7VDKydlafgVwtMeIjOPlMLMzOpuStP
	ymZvTaD9gWI1IfMZ5NSqg8G+LYMyeJhkqk0fpEnNDQsjgcdGi8iHZDO+Zt1t3kXqyrUWvJxLcErWV
	f6j/Qq1FeQ5Y5YuzXytK+zE8lOhqS8CHMbQPNZpURuIixw3n4kFOErXeD3PHJjs4IaQL75WCLgrky
	Y/raM9Mehre7+8UURNsrGAmcc0OmeNah89LvEjlpDxLmH/X1uS/to6ltZ/Brmb0AA2+NFdrQogiEj
	Qho3QpCsyv7uE8R9uXbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdvDp-00BCEj-Ko; Fri, 22 Oct 2021 14:08:37 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdvCr-00BBsD-4F
 for linux-arm-kernel@lists.infradead.org; Fri, 22 Oct 2021 14:07:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C375360FBF
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Oct 2021 14:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634911656;
 bh=u5uH9jGiutWTE/Eu97Mn7sAtTbTmAcKcqnaUojHkoKk=;
 h=References:In-Reply-To:From:Date:Subject:List-Id:To:Cc:From;
 b=SN/5s7qbG/mKgdpQ3r0xuoOq15g8yzV63uBMslquU0b5l5Gm/YNiECEI3BWUFiCa5
 SHuh8wdYQymsnAvj7oouRg3w1YVKO1sfh6QnFktm5TcpXN1iEV6b83PiIRZ/VFelMG
 4AHhcJXcmzuXVuzm3ZA8fZoClsXWf/TtTWOlH7DFEmeRuef2Fuh8G6Y8fE+bMkK/Dh
 QOQw5t6nXAmZ02UFMt8TrHs0gIzFBYBuqIlFcyS00Zo8aJ4mnVj/Ts3vMsgmC0+Xd+
 W5RlY3cbsPXqVaWTcHRpET8Os1leh6JCVBrTBccYE9VR12lxFsBtyblN2g7N77tCP/
 O+131uT9IpxRg==
Received: by mail-ed1-f44.google.com with SMTP id g8so1788880edb.12
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 22 Oct 2021 07:07:36 -0700 (PDT)
X-Gm-Message-State: AOAM531EqURiIvVj02LnvZV13zEu2bRymdfuOwTsuJhFXhlcGdDJzgvs
 4sneLgxKeFSui9tWPnX6cmmYdj86Sm40O4tklA==
X-Google-Smtp-Source: ABdhPJw4GIcdkSxeHvtX90EduWuq35zgP6j/V0Qs8+xKOiNZXSvMuTKRkAnP+P77GK8ZBydz7A7plaV3peuK+70+Jj0=
X-Received: by 2002:a17:906:6a1d:: with SMTP id
 qw29mr15601416ejc.147.1634911651559; 
 Fri, 22 Oct 2021 07:07:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210928192143.1841497-1-robh@kernel.org>
 <20211004061406.tyhldt4f26zilaaw@vireshk-i7>
 <CAL_JsqJzb3mOO-0_y+7zOQO6DMNLhAN99pDfuj55ooLULKb4WA@mail.gmail.com>
 <20211022043512.ojuz2eqwf5xgndph@vireshk-i7>
In-Reply-To: <20211022043512.ojuz2eqwf5xgndph@vireshk-i7>
From: Rob Herring <robh@kernel.org>
Date: Fri, 22 Oct 2021 09:07:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJo+908vDTMVKOT5T66+UzyH_t78ebk7+Ew0gGqbnF=SQ@mail.gmail.com>
Message-ID: <CAL_JsqJo+908vDTMVKOT5T66+UzyH_t78ebk7+Ew0gGqbnF=SQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: spear13xx: Drop malformed 'interrupt-map' on
 PCI nodes
List-Id: <soc.lore.kernel.org>
To: Viresh Kumar <viresh.kumar@linaro.org>, SoC Team <soc@kernel.org>
Cc: Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_070737_252392_B55A687E 
X-CRM114-Status: GOOD (  20.10  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20211022140719.nMCN4YILpVAQosM9yVMFGoZpPCew8v3XVY_Z_efurkQ@z>

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

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
