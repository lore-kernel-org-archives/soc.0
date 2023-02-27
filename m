Return-Path: <SRS0=1sjV=6X=sberdevices.ru=DDRokosov@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70185C64ED6
	for <soc@archiver.kernel.org>; Mon, 27 Feb 2023 16:02:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 2FA6DC4339C; Mon, 27 Feb 2023 16:02:02 +0000 (UTC)
Received: from mx.sberdevices.ru (mx.sberdevices.ru [45.89.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5CFE8C4339B;
	Mon, 27 Feb 2023 16:01:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5CFE8C4339B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sberdevices.ru
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=sberdevices.ru
Received: from s-lin-edge02.sberdevices.ru (localhost [127.0.0.1])
	by mx.sberdevices.ru (Postfix) with ESMTP id 6DE665FD23;
	Mon, 27 Feb 2023 19:01:56 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1677513716;
	bh=NnkvUE19Ly88YE4py1Bip01LJrtgfHm0WJhoIJfHc6o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	b=YaX3Q3xBXtWolaD5d4b4ilGtUb4OYoNfYDbpX+kcm46Xl2P7dRTFrM7lWyuEGuKn+
	 c91NsYXX5YcsIzecoDI5FOySRhnUOFNLTD1LroGurymqzkvXRg8mx/vpxe4A52HGvW
	 +Ee1MBwHxM/m5LrDr11nPLdKHflRbSt/Bz85VxjsyXr6Nb6bJwgooa8blZ7IX50Vwo
	 +1vnEJrSD6bb2zkhqdtdliPLRV2mrNJ8bb3j8C65LwIo79wZNCMTZEeq+farWU22cp
	 xLHmr2QnUwOo+OAcHY57b5aXMsHsGaI9EPNecxoZmICjwrYNYvwGBkk7mHMOpTOkE+
	 LYvZ9YfK0gXyw==
Received: from S-MS-EXCH01.sberdevices.ru (S-MS-EXCH01.sberdevices.ru [172.16.1.4])
	by mx.sberdevices.ru (Postfix) with ESMTP;
	Mon, 27 Feb 2023 19:01:56 +0300 (MSK)
Date: Mon, 27 Feb 2023 19:01:55 +0300
From: Dmitry Rokosov <ddrokosov@sberdevices.ru>
To: <neil.armstrong@linaro.org>
List-Id: <soc.lore.kernel.org>
CC: <arm@kernel.org>, <soc@kernel.org>, Alexey Romanov
	<avromanov@sberdevices.ru>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<linus.walleij@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <kernel@sberdevices.ru>
Subject: Re: [PATCH v1 0/3] Meson A1 32-bit support
Message-ID: <20230227160155.swzhbchrn57yfe6w@CAB-WSD-L081021>
References: <20230222115020.55867-1-avromanov@sberdevices.ru>
 <8e5f9bfa-d612-cd43-d722-d04c40938c62@linaro.org>
 <20230227142809.kujmrraf3pcdhqyn@CAB-WSD-L081021>
 <13cf3223-d3fb-1a3e-f13a-77db3b6d144c@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <13cf3223-d3fb-1a3e-f13a-77db3b6d144c@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [172.16.1.6]
X-ClientProxiedBy: S-MS-EXCH02.sberdevices.ru (172.16.1.5) To
 S-MS-EXCH01.sberdevices.ru (172.16.1.4)
X-KSMG-Rule-ID: 4
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Status: not scanned, disabled by settings
X-KSMG-AntiSpam-Interceptor-Info: not scanned
X-KSMG-AntiPhishing: not scanned, disabled by settings
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 1.1.2.30, bases: 2023/02/27 12:14:00 #20900843
X-KSMG-AntiVirus-Status: Clean, skipped

On Mon, Feb 27, 2023 at 03:46:50PM +0100, neil.armstrong@linaro.org wrote:
> On 27/02/2023 15:28, Dmitry Rokosov wrote:
> > Hello Neil!
> > 
> > On Mon, Feb 27, 2023 at 09:15:04AM +0100, neil.armstrong@linaro.org wrote:
> > 
> > [...]
> > 
> > > I'm aware Amlogic also runs their kernel as 32bit to gain a few kbytes
> > > of memory, but those processors are ARMv8 and the arm64 arch code
> > > has been designed for those CPUs.
> > > 
> > > So far I didn't find a single good reason to add 32bit support for
> > > ARMv8 Amlogic based SoCs, if you have a solid reason please share.
> > 
> > I totally agree with you, but I suppose it's fully related to 'big'
> > Amlogic SoC like S905_ or A311_ series. A113L (aka 'a1') is
> > a cost-efficient dual-core SoC which is used for small, cheap solutions
> > with cheap components. Every cent is important during BoM development.
> > That's why usually ODMs install small ROM and RAM capacity, and each
> > megabyte is important for RAM/ROM kernel and rootfs footprints.
> 
> Do you have figures ? is 32bit ARM kernel really lighter when ARM64 one is correctly configured ?

As I mentioned in the previous message, we have reached good results for
userspace profile. For the kernel, we have disabled heavy cost memory
features (like dynamic tracing) at both configurations, and get more or
less the same results for memory footprint (pre-allocated for kernel
sections).
I can provide rootfs figures/results, but I'm afraid it's so workload
dependent and very custom for us.

> 
> > Why am I talking about rootfs? For such small projects a good
> > choice is buildroot rootfs assembling framework. Unfortunatelly,
> > buildroot doesn't support 'compat' mode when kernel and userspace have
> > a different bitness.
> 
> well this is a buildroot problem... the kernel itself is perfectly capable
> of running an AArch32 userspace.

Based on your and Arnd arguments, agree, this is a buildroot problem
with compat mode definition.
Buildroot must have it for such configurations with mainline kernel.

[...]

-- 
Thank you,
Dmitry
