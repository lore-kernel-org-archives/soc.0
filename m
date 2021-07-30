Return-Path: <SRS0=BD2L=MW=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C31DBC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 15:09:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8FE3B60F0F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jul 2021 15:09:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8FE3B60F0F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2EAPV5RoaPn/nvG/ynVCb1i9UbLckk3Rfdg0Ef3xnes=; b=syEkHQonI7ma/L
	woCXBy+QDrgcELdtZJTEFHNb43IGoqoTn7iKSyDvRg8xq8/D5RsU5YA5k8TUAPKfogBrH1mX4/Ytr
	xIuVdNjzf/9sdFYPIL4I9jAy+xjBPQ4V4/ovrit/vDMv9R7WQ9G8vn7ziaB6nkccynWHxeqdW9XW0
	F3Opydfl7jj460i1S6FGqTsWoFacSkVm/RjLpuL+40Qocn91V42TsVvgmavcuP6JueLxifGgsDkH/
	rMnV4Jf66TGQoC8eHfyaCI3bHILCbvMRbCIE5m0pTD41W8AxvDKUcxR3AbhLyP+WvjbONQVqVQZmw
	hh9nd7xnG8nChMOZiWZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9U61-0099mo-4A; Fri, 30 Jul 2021 15:06:45 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Tyd-0095q8-K0
 for linux-arm-kernel@lists.infradead.org; Fri, 30 Jul 2021 14:59:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1A441063;
 Fri, 30 Jul 2021 07:59:06 -0700 (PDT)
Received: from C02TD0UTHF1T.local (unknown [10.57.13.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 464EF3F66F;
 Fri, 30 Jul 2021 07:59:04 -0700 (PDT)
Date: Fri, 30 Jul 2021 15:59:01 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Bert Vermeulen <bert@biot.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org,
 Rob Herring <robh+dt@kernel.org>, John Crispin <john@phrozen.org>,
 Felix Fietkau <nbd@nbd.name>
Subject: Re: [PATCH 3/5] ARM: dts: Add basic support for EcoNet EN7523
Message-ID: <20210730145901.GC19569@C02TD0UTHF1T.local>
References: <20210730134552.853350-1-bert@biot.com>
 <20210730134552.853350-4-bert@biot.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210730134552.853350-4-bert@biot.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210730_075907_786204_F93261B2 
X-CRM114-Status: GOOD (  15.82  )
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
Message-ID: <20210730145901.DaoJbpsbJ2lty647KtzlPZ88p1TFAu6l2oWlk5u2yLA@z>

On Fri, Jul 30, 2021 at 03:45:50PM +0200, Bert Vermeulen wrote:
> From: John Crispin <john@phrozen.org>
> 
> Add basic support for EcoNet EN7523, enough for booting to console.
> 
> The UART is basically 8250-compatible, except for the clock selection.
> A clock-frequency value is synthesized to get this to run at 115200 bps.
> 
> Signed-off-by: John Crispin <john@phrozen.org>
> Signed-off-by: Bert Vermeulen <bert@biot.com>
> ---
>  arch/arm/boot/dts/Makefile       |   2 +
>  arch/arm/boot/dts/en7523-evb.dts |  17 ++++
>  arch/arm/boot/dts/en7523.dtsi    | 128 +++++++++++++++++++++++++++++++
>  3 files changed, 147 insertions(+)
>  create mode 100644 arch/arm/boot/dts/en7523-evb.dts
>  create mode 100644 arch/arm/boot/dts/en7523.dtsi
> 

> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;

> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			clock-frequency = <80000000>;
> +			next-level-cache = <&L2_0>;
> +
> +		};

> +	gic: interrupt-controller@09000000 {
> +		compatible = "arm,gic-v3";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x09000000 0x20000>,
> +			  <0x09080000 0x80000>;
> +		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +
> +		its: gic-its@09020000 {
> +			compatible = "arm,gic-v3-its";
> +			msi-controller;
> +			#msi-cell = <1>;

Missing 's' here for '#msi-cells'.

> +			reg = <0x090200000 0x20000>;
> +		};
> +	};

Looking at this again, I was under the impression that Cortex-A7 only
supported GICv2; is this actually a Cortex-A7 or a different CPU?

Which revision is this?

Thanks,
Mark.

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
