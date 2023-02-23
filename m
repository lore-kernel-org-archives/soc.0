Return-Path: <SRS0=kkb9=6T=lunn.ch=andrew@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6C4C61DA4
	for <soc@archiver.kernel.org>; Thu, 23 Feb 2023 14:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 8F35CC4339E; Thu, 23 Feb 2023 14:43:34 +0000 (UTC)
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4A403C433D2;
	Thu, 23 Feb 2023 14:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4A403C433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=biWqzELsRv+91ZRk60TxgEOmtijvUSmBpGQYbMMdtjg=; b=YTtiKvruE9SgoGwseDbbXnADZS
	i1Jb00qXFg4FfeJmE4kw5UePBqeYYS9Ov92VZK/QCgWz6U2QQhzuE8m1PhTz21IY2XS0mqasoUuC2
	/2T9DxMxAfYyITENqOgDJUkzBI/3Xk+lRyiEIX2csPnbyBCXjjxA/DnAIYFIWaEKQznQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1pVCoU-005ngU-Jq; Thu, 23 Feb 2023 15:43:14 +0100
Date: Thu, 23 Feb 2023 15:43:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: INAGAKI Hiroshi <musashino.open@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com, arnd@arndb.de, olof@lixom.net,
	soc@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
Message-ID: <Y/d7gjqQCKKXMHqj@lunn.ch>
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230223132502.2045-2-musashino.open@gmail.com>

> +		pcie {
> +			status = "okay";
> +
> +			pcie@1,0 {
> +				status = "okay";
> +
> +				/* Atheros AR9287 */
> +				wifi@0,0 {
> +					compatible = "pci168c,002e";
> +					reg = <0000 0 0 0 0>;
> +				};
> +			};
> +
> +			pcie@3,0 {
> +				status = "okay";
> +
> +				/* Qualcomm Atheros QCA9880 */
> +				wifi@0,0 {
> +					compatible = "qcom,ath10k";
> +					reg = <0000 0 0 0 0>;
> +				};
> +			};
> +		};
> +	};

These are not wrong, but they are also not needed. PCI devices should
be discovered by enumeration, and you don't have any additional
properties here, or phandles pointing to these nodes.

I assume these are COTS wifi modules? By listing them here you are
restricting some flexibility. The OEM could for example swap the
modules around, and Linux would not care, but the DT would then be
wrong. Or you could have a device with a different module because it
is cheaper, and again, Linux would not care, but the DT would be
wrong.

> +&usb0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pmx_usb_pins>;
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	/* SMSC USB2514B */
> +	hub@1 {
> +		compatible = "usb424,2514";
> +		reg = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		hub_port1: port@1 {
> +			reg = <1>;
> +			#trigger-source-cells = <0>;
> +		};
> +
> +		hub_port2: port@2 {
> +			reg = <2>;
> +			#trigger-source-cells = <0>;
> +		};
> +	};
> +};

Same comment as PCI. However, it is likely that the USB hub is
actually on the board, not a module, so it is a lot less likely to
change.

As i said, they are not wrong, so you don't need to remove them.

	Andrew

