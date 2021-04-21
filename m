Return-Path: <SRS0=AlHn=JS=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A128C433B4
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 07:52:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3624F61182
	for <linux-amlogic@archiver.kernel.org>; Wed, 21 Apr 2021 07:52:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3624F61182
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q9xWRcI14VzslZEZvSqkIwqOPT7xyYsiLZCYgmwCH28=; b=Aj3fEObHcADzzZ+s7seKVCJXg
	6Che/NlUw35+7JXXC6UgqYU7QeCPpt72oTk23BMxE0HbvOsglgvGwJ5PEY6VshUq1YrQblbyIixnj
	KsjMKahDkljbidGA5+OdNLGXutI55OPnUVbKoHJMa+erTPn2gLjaThhQO3ub8Gaqkr0U3H0Skdv90
	/zz9jJDIYBP0lcNldaRv3z6KqPgmJExgpItyR4ADdZk2infhC0036wtHopTzXEIE6CRy4bqduRMPm
	i62BKvPJ9Q9YJ8Zpo++/lioHQO+tjvxA5Htf2tzpNpVj7nhjtxXwaeykRWlHI726kEDSJDGfO82YZ
	lJBPYJohg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ7eI-00DvcL-SS; Wed, 21 Apr 2021 07:51:51 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ7eG-00Dvbx-KU
 for linux-amlogic@desiato.infradead.org; Wed, 21 Apr 2021 07:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=2P4oG7HNo+SuYtU66Lpge91f6btqFbYk+DdM40W1Mys=; b=YFq1+c20ro25scQ5B1V483iQP4
 OGieB8uhBbelZmClFoje0dt22jv0i+h8bySpKisS6Kv0ydjkxdYHPfJlzLCHwzv3t2YB2W/WiFF9h
 7hb2ifUcEHKJtU4uwSxb2B6BzwA9kNsUBZWY9GH7gUYujOgByVQuuvvs26epl8D21ESXuAPEhg2De
 Ns03J5Lh86Mi58CB2XtUvGLYdjvoOpi4FdbVqBUFy7Va4+oEMJGt+idJu/cTYAbOwt0yjdJ9zD+sL
 GeE89JaZzeJf/HbHhXscz54I+fg1XggY85ZN2tsmBH9+hsbZlYqMVbyYF7XYn1ChuO3usyi9w8mHX
 ekqJebEg==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ7eA-00Cgaq-VZ
 for linux-amlogic@lists.infradead.org; Wed, 21 Apr 2021 07:51:47 +0000
Received: by mail-wm1-x32c.google.com with SMTP id k128so21603122wmk.4
 for <linux-amlogic@lists.infradead.org>; Wed, 21 Apr 2021 00:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2P4oG7HNo+SuYtU66Lpge91f6btqFbYk+DdM40W1Mys=;
 b=z3/u6OZkBdphC2McY1DgqhO0PkFD9aCB11OnPgMNqnUFI9fFLvHqHdCLSkbDWb+B6Q
 ftXq1w29JCnXnxlxqaMsjQt2nQwCzgTF/kNyaxxGDDgn1r4oFzilmDLU1W14pbD1FWwk
 MlFyJvZ30zLWCgv5gf0rg3BGODpkBuIzBqa25zDix0mr+RapkLBufyD9UGU7bdxA1J6w
 vyZkvwJJfzllprlKirReAKAN4FLmMHHU/Ui8TqyBrXBaMSkqyt/8sU9TtJ0MqbLFrjwh
 KraiH4ER1pxa2bCgPYmgA7GLBmf5BsNHF137kkIgSkSwVgp2GlUxFHU75hZwqPAwjXSI
 4Onw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2P4oG7HNo+SuYtU66Lpge91f6btqFbYk+DdM40W1Mys=;
 b=PM8Kary8qh7H8vCHIus+BQg+jsMMFMBt2YuxjWfxwnuZq6/BGTpwtnluVixw52ZhCe
 gUug4ejdMjB0N/+2kaXABF3i3qtP7geAFd8++pkqANUQ5ysFoB12YeTUumHA7Dl5cvcp
 xfjhIh2g47h3Q0+aYHXm+vYMqdZXm8MQpxxaY6ed9PsBynYmkGwpbDYJ75zTcfR2mWfJ
 4HK6rQth/nXd0FyU+V7tGg4CxHPR3B5D6MPUk3GYOZSSZIB6YuTjc69CNRFpyu+3fuIx
 kOtmK+zDTDfVCH6/DtLikhHXFHKoSncLAwkkBMJk7OWPIhDj2Rysr6QrM81XHHnF7qSO
 W5qA==
X-Gm-Message-State: AOAM532+me6q1z0QbZIw+PmE9b6LkpM/cknknTgEAJrFsyPtZ5sakjzp
 bDcFl0vT+NafYtRYguY0Gyihj+GAxlPnsCy0
X-Google-Smtp-Source: ABdhPJxGfIwVljwt0ch8b7JClfDnBt9G4Bnf4/bwNmrGSmCntIKRvd9mMKse0unWvkoTLCcXvbeiqg==
X-Received: by 2002:a05:600c:4149:: with SMTP id
 h9mr8215720wmm.43.1618991501104; 
 Wed, 21 Apr 2021 00:51:41 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:f781:73d5:3127:752d?
 ([2a01:e0a:90c:e290:f781:73d5:3127:752d])
 by smtp.gmail.com with ESMTPSA id m2sm1386979wmq.15.2021.04.21.00.51.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Apr 2021 00:51:40 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: amlogic: misc DT schema fixups
List-Id: <soc.lore.kernel.org>
To: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
 soc@kernel.org, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
References: <20210420230402.8807-1-khilman@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <0a28f65f-716a-d67e-6fc4-2785c19b7ab3@baylibre.com>
Date: Wed, 21 Apr 2021 09:51:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210420230402.8807-1-khilman@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_005143_113465_17B4F9B5 
X-CRM114-Status: GOOD (  24.91  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
Message-ID: <20210421075140.EQZEnKEg3DXYl3_DGxcczudxAo4xxCw-L2LwxMS215E@z>

On 21/04/2021 01:04, Kevin Hilman wrote:
> Take a pass at cleaning up a bunch of warnings
> from 'make dtbs_check' that have crept in.
> 
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> ---
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml  |  5 +++++
>  .../bindings/media/amlogic,axg-ge2d.yaml           |  1 +
>  Documentation/devicetree/bindings/media/rc.yaml    |  4 ++++
>  .../devicetree/bindings/sound/amlogic,t9015.yaml   |  1 +
>  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi  | 14 +++++++-------
>  .../arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts |  2 +-
>  .../boot/dts/amlogic/meson-g12b-gtking-pro.dts     |  4 ++--
>  arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts  |  2 +-
>  .../boot/dts/amlogic/meson-g12b-odroid-n2.dtsi     |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  2 +-
>  .../dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |  8 ++++----
>  .../boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts |  2 +-
>  .../boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts   |  2 +-
>  .../boot/dts/amlogic/meson-gxm-wetek-core2.dts     |  2 +-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi |  4 ++--
>  .../arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts |  2 +-
>  18 files changed, 38 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> index 184492162e7e..db2240bad012 100644
> --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> @@ -69,6 +69,11 @@ properties:
>  
>        where voltage is in V, frequency is in MHz.
>  
> +  dma-coherent:
> +    description: |
> +      Present if page table walks made by the SMMU are cache coherent with the
> +      CPU.
> +
>  required:
>    - compatible
>    - reg

I think this one should go in a separate patch since it's not amlogic only.

> diff --git a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
> index bee93bd84771..f3a337954eb3 100644
> --- a/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
> +++ b/Documentation/devicetree/bindings/media/amlogic,axg-ge2d.yaml
> @@ -33,6 +33,7 @@ required:
>    - interrupts
>    - clocks
>    - resets
> +  - reset-names

Remove the reset-names from DT instead

>  
>  additionalProperties: false
>  
> diff --git a/Documentation/devicetree/bindings/media/rc.yaml b/Documentation/devicetree/bindings/media/rc.yaml
> index 946441b4e1a5..c4a088669112 100644
> --- a/Documentation/devicetree/bindings/media/rc.yaml
> +++ b/Documentation/devicetree/bindings/media/rc.yaml
> @@ -90,9 +90,12 @@ properties:
>        - rc-leadtek-y04g0051
>        - rc-lme2510
>        - rc-manli
> +      - rc-mecool-kii-pro
> +      - rc-mecool-kiii-pro
>        - rc-medion-x10
>        - rc-medion-x10-digitainer
>        - rc-medion-x10-or2x
> +      - rc-minix-neo
>        - rc-msi-digivox-ii
>        - rc-msi-digivox-iii
>        - rc-msi-tvanywhere
> @@ -145,6 +148,7 @@ properties:
>        - rc-videomate-s350
>        - rc-videomate-tv-pvr
>        - rc-videostrong-kii-pro
> +      - rc-vega-s9x
>        - rc-wetek-hub
>        - rc-wetek-play2
>        - rc-winfast
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> index c7613ea728d4..7bcbed603824 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> @@ -41,6 +41,7 @@ required:
>    - clocks
>    - clock-names
>    - resets
> +  - reset-names

Remove the reset-names from DT instead

>  
>  additionalProperties: false
>  
> diff --git a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> index 755b4ad15184..b4000cf65a9a 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-a1.dtsi
> @@ -88,13 +88,13 @@ reset: reset-controller@0 {
>  				#reset-cells = <1>;
>  			};
>  
> -			periphs_pinctrl: pinctrl@0400 {
> +			periphs_pinctrl: pinctrl@400 {
>  				compatible = "amlogic,meson-a1-periphs-pinctrl";
>  				#address-cells = <2>;
>  				#size-cells = <2>;
>  				ranges;
>  
> -				gpio: bank@0400 {
> +				gpio: bank@400 {
>  					reg = <0x0 0x0400 0x0 0x003c>,
>  					      <0x0 0x0480 0x0 0x0118>;
>  					reg-names = "mux", "gpio";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> index 3dd2a5a8739b..793d48f72390 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi
> @@ -128,9 +128,9 @@ soc {
>  
>  		pcie: pcie@fc000000 {
>  			compatible = "amlogic,g12a-pcie", "snps,dw-pcie";
> -			reg = <0x0 0xfc000000 0x0 0x400000
> -			       0x0 0xff648000 0x0 0x2000
> -			       0x0 0xfc400000 0x0 0x200000>;
> +			reg = <0x0 0xfc000000 0x0 0x400000>,
> +			      <0x0 0xff648000 0x0 0x2000>,
> +			      <0x0 0xfc400000 0x0 0x200000>;
>  			reg-names = "elbi", "cfg", "config";
>  			interrupts = <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
>  			#interrupt-cells = <1>;
> @@ -140,8 +140,8 @@ pcie: pcie@fc000000 {
>  			#address-cells = <3>;
>  			#size-cells = <2>;
>  			device_type = "pci";
> -			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000
> -				  0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
> +			ranges = <0x81000000 0 0 0x0 0xfc600000 0 0x00100000>,
> +				 <0x82000000 0 0xfc700000 0x0 0xfc700000 0 0x1900000>;
>  
>  			clocks = <&clkc CLKID_PCIE_PHY
>  				  &clkc CLKID_PCIE_COMB
> @@ -2009,7 +2009,7 @@ mux {
>  				};
>  			};
>  
> -			vrtc: rtc@0a8 {
> +			vrtc: rtc@a8 {
>  				compatible = "amlogic,meson-vrtc";
>  				reg = <0x0 0x000a8 0x0 0x4>;
>  			};
> @@ -2187,7 +2187,7 @@ gpio_intc: interrupt-controller@f080 {
>  				amlogic,channel-interrupts = <64 65 66 67 68 69 70 71>;
>  			};
>  
> -			watchdog: wdt@f0d0 {
> +			watchdog: watchdog@f0d0 {
>  				compatible = "amlogic,meson-gxbb-wdt";
>  				reg = <0x0 0xf0d0 0x0 0x10>;
>  				clocks = <&xtal>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> index 211191f66344..6c7bfacbad78 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts
> @@ -12,7 +12,7 @@
>  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>  
>  / {
> -	compatible = "azw,gsking-x", "amlogic,g12b";
> +	compatible = "azw,gsking-x", "amlogic,s922x", "amlogic,g12b";
>  	model = "Beelink GS-King X";
>  
>  	aliases {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> index 0e331aa5a2d7..707daf92787b 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts
> @@ -11,7 +11,7 @@
>  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>  
>  / {
> -	compatible = "azw,gtking", "amlogic,g12b";
> +	compatible = "azw,gtking", "amlogic,s922x", "amlogic,g12b";
>  	model = "Beelink GT-King Pro";
>  
>  	aliases {
> @@ -35,7 +35,7 @@ power-button {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		white {
> +		led-white {
>  			label = "power:white";
>  			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_HIGH>;
>  			default-state = "on";
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> index a7db84a500bb..5d96c1449050 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts
> @@ -11,7 +11,7 @@
>  #include <dt-bindings/sound/meson-g12a-tohdmitx.h>
>  
>  / {
> -	compatible = "azw,gtking", "amlogic,g12b";
> +	compatible = "azw,gtking", "amlogic,s922x", "amlogic,g12b";
>  	model = "Beelink GT-King";
>  
>  	aliases {
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> index 473b81c652cf..344573e157a7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi
> @@ -42,7 +42,7 @@ emmc_pwrseq: emmc-pwrseq {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		blue {
> +		led-blue {
>  			label = "n2:blue";
>  			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
> @@ -497,7 +497,7 @@ &gpio {
>  	 * This signal should be handled by a USB specific power sequence
>  	 * in order to reset the Hub when USB bus is powered down.
>  	 */
> -	usb-hub {
> +	hog-0 {
>  		gpio-hog;
>  		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
>  		output-high;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> index bfaf7f41a2d6..201596247fd9 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
> @@ -257,7 +257,7 @@ &gpio_ao {
>  	 * This signal should be handled by a USB specific power sequence
>  	 * in order to reset the Hub when USB bus is powered down.
>  	 */
> -	usb-hub {
> +	hog-0 {
>  		gpio-hog;
>  		gpios = <GPIOAO_4 GPIO_ACTIVE_HIGH>;
>  		output-high;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
> index 5ab5d3aa0646..c529b6c860a4 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-mecool-kii-pro.dts
> @@ -44,7 +44,7 @@ button@0 {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		blue {
> +		led-blue {
>  			color = <LED_COLOR_ID_BLUE>;
>  			function = LED_FUNCTION_POWER;
>  			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
> index ad6d72254150..b331a013572f 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts
> @@ -16,28 +16,28 @@ / {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		yellow {
> +		led-yellow {
>  			color = <LED_COLOR_ID_YELLOW>;
>  			function = LED_FUNCTION_STATUS;
>  			gpios = <&gpio_ao GPIOAO_6 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  		};
>  
> -		blue {
> +		led-blue {
>  			color = <LED_COLOR_ID_BLUE>;
>  			function = LED_FUNCTION_STATUS;
>  			gpios = <&gpio GPIODV_28 GPIO_ACTIVE_HIGH>;
>  			default-state = "off";
>  		};
>  
> -		green {
> +		led-green {
>  			color = <LED_COLOR_ID_GREEN>;
>  			function = LED_FUNCTION_STATUS;
>  			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
>  			default-state = "on";
>  		};
>  
> -		red {
> +		led-red {
>  			color = <LED_COLOR_ID_RED>;
>  			function = LED_FUNCTION_STATUS;
>  			gpios = <&gpio GPIODV_27 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
> index 0651756d7fb5..ebebf344b715 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-mecool-kiii-pro.dts
> @@ -49,7 +49,7 @@ button@0 {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		blue {
> +		led-blue {
>  			color = <LED_COLOR_ID_BLUE>;
>  			function = LED_FUNCTION_POWER;
>  			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
> index a414cd39c2b1..ea9f234d1fc7 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-minix-neo-u9h.dts
> @@ -17,7 +17,7 @@ / {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		white {
> +		led-white {
>  			color = <LED_COLOR_ID_WHITE>;
>  			function = LED_FUNCTION_POWER;
>  			gpios = <&gpio_ao GPIOAO_9 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
> index ec794c134c15..1e7f77f9b533 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-gxm-wetek-core2.dts
> @@ -22,7 +22,7 @@ memory@0 {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		blue {
> +		led-blue {
>  			color = <LED_COLOR_ID_BLUE>;
>  			function = LED_FUNCTION_STATUS;
>  			gpios = <&gpio GPIODV_24 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> index 877e3b989203..66d67524b031 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi
> @@ -43,14 +43,14 @@ button-function {
>  	leds {
>  		compatible = "gpio-leds";
>  
> -		white {
> +		led-white {
>  			color = <LED_COLOR_ID_WHITE>;
>  			function = LED_FUNCTION_STATUS;
>  			gpios = <&gpio_ao GPIOAO_4 GPIO_ACTIVE_HIGH>;
>  			linux,default-trigger = "heartbeat";
>  		};
>  
> -		red {
> +		led-red {
>  			color = <LED_COLOR_ID_RED>;
>  			function = LED_FUNCTION_STATUS;
>  			gpios = <&gpio_expander 5 GPIO_ACTIVE_HIGH>;
> diff --git a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> index b2a4e823c1d8..8c327c03d845 100644
> --- a/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> +++ b/arch/arm64/boot/dts/amlogic/meson-sm1-odroid-c4.dts
> @@ -47,7 +47,7 @@ &gpio {
>  	 * This signal should be handled by a USB specific power sequence
>  	 * in order to reset the Hub when USB bus is powered down.
>  	 */
> -	usb-hub {
> +	hog-0 {
>  		gpio-hog;
>  		gpios = <GPIOH_4 GPIO_ACTIVE_HIGH>;
>  		output-high;
> 

Apart that, the other changes are OK.


Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
