Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113D9C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:36:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A85816113C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A85816113C
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VCnLaP3+0cSxBWTi4xTKayZsX1enDjvl5z3JMP2HZzg=; b=my0czH+y81zEaRUnGFNsC/3Fx
	bzaJBoApvUbDOLaWQu7XUzU17k6aY2IA3d2E9CxCDGh4Gl/VOz9WtxIPGtA1XlTpvnTBSEUWIkZkm
	J9OJnANDG5L1ord3R4tH5lKx1CFYqyC7pPzm5Yg23iWjKfdFzM4ry6D/a95p9yE8tDk8EGTrdEGaN
	ad1iuljGJ4wFYQPcUmwxMjUhvX3YtMJ6LwPBhRH8YIb4wRJyXXsmJ5QkoN7oEJMFwQRxdTdZYG2i0
	Yqsnz1KYEudtdq9QOV3qU0PZapeD9q/8UVn0EKTjDGuLOqQ3Akiwu96FxMnq83o+11OKj4IGNWr4X
	PhidRwFEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUbLg-009Drc-CW; Thu, 08 Apr 2021 20:33:56 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUbLb-009Dqw-Px
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 20:33:54 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 138KXmI1093663;
 Thu, 8 Apr 2021 15:33:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1617914028;
 bh=10BMFLUqlV8GVdS5cFsilLWusC/DF5YsA+ZG6gaonRk=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=unwymwSQjkmZxU5zvQEyiFxbncadqfeGajKtPAmGnmSTwezZ8S1xiAK5d8ZiGSvNy
 KWToQY31GYGg6JGMnxE9Z0XTiTG4Bo5KqsyuviiIz4BlXioVdns4MeBrfJLJr2Z4Tk
 U82vaWhpZgTMWx1Io/E3a8zTlqgEYBSvFW371si8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 138KXmtA102347
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 8 Apr 2021 15:33:48 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 8 Apr
 2021 15:33:48 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 8 Apr 2021 15:33:48 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 138KXm9G006412;
 Thu, 8 Apr 2021 15:33:48 -0500
Date: Thu, 8 Apr 2021 15:33:48 -0500
From: Nishanth Menon <nm@ti.com>
To: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
CC: SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>, arm-soc
 <arm@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Tero
 Kristo <kristo@kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] arm64: dts: TI K3 updates for v5.13
Message-ID: <20210408203348.vafestu55hpw3zeq@bluff>
References: <20210405155336.smohb7uzkperqwuz@reflex>
 <161789493785.1630479.2066806618809349698.b4-ty@arndb.de>
 <20210408163439.x7pz7bitwmu7aenl@freckled>
 <CAK8P3a0r3knGP5XxSz_K4zj4=iMNg_UysJLS8jdgqAZunLfLLw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a0r3knGP5XxSz_K4zj4=iMNg_UysJLS8jdgqAZunLfLLw@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_213352_449175_8A1755C3 
X-CRM114-Status: GOOD (  24.32  )
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
Message-ID: <20210408203348.VJSX7p-GZKkmP9lRNEJOPOPc3ftgF5VvCq63bf95h98@z>

On 22:13-20210408, Arnd Bergmann wrote:
> On Thu, Apr 8, 2021 at 6:34 PM Nishanth Menon <nm@ti.com> wrote:
> > On 17:24-20210408, Arnd Bergmann wrote:
> > >
> > > ti/k3-am64-main.dtsi:376.40-385.4: Warning (simple_bus_reg): /bus@f4000/interrupt-controller0: missing or empty reg/ranges property
> > > ti/k3-am64-main.dtsi:45.13-135.4: Warning (simple_bus_reg): /bus@f4000/dmss: missing or empty reg/ranges property
> > > ti/k3-am64-mcu.dtsi:77.39-86.4: Warning (simple_bus_reg): /bus@f4000/bus@4000000/interrupt-controller1: missing or empty reg/ranges property
> > >
> > > ti/k3-am642-evm.dt.yaml: bus@4000000: interrupt-controller1: {'type': 'object'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger-type': [[1]], 'interrupt-controller': True, 'interrupt-parent': [[1]], '#interrupt-cells': [[1]], 'ti,sci': [[4]], 'ti,sci-dev-id': [[5]], 'ti,interrupt-ranges': [[0, 104, 4]], 'phandle': [[5]]}
> > > ti/k3-am642-evm.dt.yaml: bus@f4000: dmss: {'type': 'object'} is not allowed for {'compatible': ['simple-mfd'], '#address-cells': [[2]], '#size-cells': [[2]], 'dma-ranges': True, 'ranges':  'phandle': [[7]]}}
> > > ti/k3-am642-evm.dt.yaml: bus@f4000: interrupt-controller0: {'type': 'object'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger-type': [[1]], 'interrupt-controller': True, 'interrupt-parent': [[1]], '#interrupt-cells': [[1]], 'ti,sci': [[4]], 'ti,sci-dev-id': [[3]], 'ti,interrupt-ranges': [[0, 32, 16]], 'phandle': [[15]]}
> > > ti/k3-am642-evm.dt.yaml: flash@0: 'cdns,read-delay', 'cdns,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'
> > > ti/k3-am642-sk.dt.yaml: bus@4000000: interrupt-controller1: {'type': 'object'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger-type': [[1]], ...
> > > ti/k3-am642-sk.dt.yaml: bus@f4000: dmss: {'type': 'object'} is not allowed for {'compatible': ['simple-mfd'], ...
> > > ti/k3-am642-sk.dt.yaml: bus@f4000: interrupt-controller0: {'type': 'object'} is not allowed for {'compatible': ['ti,sci-intr'], 'ti,intr-trigger-type': [[1]], 'interrupt-controller': True, 'interrupt-parent': [[1]], '#interrupt-cells': [[1]], 'ti,sci': [[4]], 'ti,sci-dev-id': [[3]], 'ti,interrupt-ranges': [[0, 32, 16]], 'phandle': [[11]]}
> > > ti/k3-am642-sk.dt.yaml: flash@0: 'cdns,read-delay', 'cdns,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'
> > > ti/k3-j7200-common-proc-board.dt.yaml: flash@0: 'cdns,read-delay', 'cdns,tchsh-ns', 'cdns,tsd2d-ns', 'cdns,tshsl-ns', 'cdns,tslch-ns' do not match any of the regexes: '^partition@', 'pinctrl-[0-9]+'
> > >
> > >
> > > merge commit: 4b8cf90637f295ff1cb1f4bdfde134dab1196296
> >
> >
> > We have a bunch of problems with interrupt controller definitions -
> > attempts in [1] [2] did'nt seem to come to any form of conclusion yet.
> >
> > Cdns is a convert from txt to yaml and is queued on Marks' tree[3]
> 
> Ok, thanks for taking a look
> 

Apologies on not flagging in my PR itself.

> > These issues pre-existed in existing definitions and/or convertion
> > from txt and we are already working to make sure we try and reach a
> > conclusion soon[4]. I am guessing from your note that it is high time we
> > put our foot down on txt bindings and clean yamls, I will ensure we
> > follow up on that.
> 
> I'm still trying to figure out how to best script it, my intention was to
> only list issues that got introduced in the latest patches rather than
> the existing problems.

I had done a bit of scripting around this already in my checker:
https://github.com/nmenon/kernel_patch_verify/blob/master/kernel_patch_verify#L212
Though it never works quite right all the time.. So, i do run explicit
checks afterwards to try and catch these.. and containerizing them
helped deployment aspects(developers having different schema package
versions) in control as well.

but yeah, a clean way of doing things still eludes me.

> 
> On the other hand, it would indeed help to address any issues that
> are going to come up in every newly added board first, and then
> eventually get to all the remaining warnings for issues with the
> yaml bindings.

yep, some of the troubles I had has relation to schema checks getting
stricter after I had queued things up, and then having to make a
choice :(. But internally, I am tracking those in our tracking system
and team has been given a headsup that we cleanup yamls before we add
any further nodes.

> 

The following also need to be converted to yaml (internal
JIRA tracking already done).

Documentation/devicetree/bindings/arm/keystone/ti,sci.txt
Documentation/devicetree/bindings/gpio/gpio-davinci.txt
Documentation/devicetree/bindings/i2c/i2c-omap.txt
Documentation/devicetree/bindings/input/touchscreen/ti-tsc-adc.txt
Documentation/devicetree/bindings/mailbox/omap-mailbox.txt
Documentation/devicetree/bindings/mailbox/ti,secure-proxy.txt
Documentation/devicetree/bindings/mtd/ti,am654-hbmc.txt
Documentation/devicetree/bindings/pci/pci-keystone.txt
Documentation/devicetree/bindings/phy/ti,phy-am654-serdes.txt
Documentation/devicetree/bindings/pwm/pwm-tiecap.txt
Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.txt
Documentation/devicetree/bindings/serial/omap_serial.txt
Documentation/devicetree/bindings/spi/omap-spi.txt

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
