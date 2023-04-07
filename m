Return-Path: <SRS0=JPhp=76=bootlin.com=gregory.clement@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11283C77B61
	for <soc@archiver.kernel.org>; Fri,  7 Apr 2023 15:34:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CF152C4339B; Fri,  7 Apr 2023 15:34:41 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CF2DC433D2;
	Fri,  7 Apr 2023 15:34:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4CF2DC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: (Authenticated sender: gregory.clement@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id C6B64100006;
	Fri,  7 Apr 2023 15:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1680881677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=D2Wdjko2vA/SMrvlsYQ/Ry1S7hpAQ7U5YkaaIz6cUuc=;
	b=fn8h7+IEzDznrfjQOvUfEH16tLHE9gDE8fxoXz2qEfjZcdJcLzzNQtX0KNawvdyA7OpZEQ
	wcl7V3ZEEbmmXtyyFNe7iO1Kvw5ix9GNripEeat05KnY1zROw1AQmIRKQviN7coVHxwqCQ
	jPp/3KqmnDj9UgirLMAYaZau67njqRFkzVHScdVbCFmtxk7QyU9lcCa5+ufXpy0JtcPks8
	0p5X8petEfVMk7ZHnrk2Qxi1lb6hHXVRQH1ps6EXgBccVqPe3UmNiZ2d6BMc8dHChytCl1
	Pqgbxty4EAfzXmkB32l+fWwnxKHbPgkuhtXE3ee405BYbevPgVAK0cZ4mY0KgA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: INAGAKI Hiroshi <musashino.open@gmail.com>, Andrew Lunn <andrew@lunn.ch>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, sebastian.hesselbarth@gmail.com,
 arnd@arndb.de, olof@lixom.net, soc@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
In-Reply-To: <7d4a218d-8b8a-5a1d-eff8-e154bfde69be@gmail.com>
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com>
 <Y/d7gjqQCKKXMHqj@lunn.ch>
 <7d4a218d-8b8a-5a1d-eff8-e154bfde69be@gmail.com>
Date: Fri, 07 Apr 2023 17:34:34 +0200
Message-ID: <87jzyn3dv9.fsf@BL-laptop>
MIME-Version: 1.0
Content-Type: text/plain

Hello INAGAKI Hiroshi,

do you plan to send a v2 soon based on the reviews you got ?

Or if you already sent it, I missed it, in this case could you resend it
with me in CC ?

Thanks,

Gregory

> Hi Andrew,
>
> thank you for your reviews and detailed descriptions.
>
> On 2023/02/23 23:43, Andrew Lunn wrote:
>>> +		pcie {
>>> +			status = "okay";
>>> +
>>> +			pcie@1,0 {
>>> +				status = "okay";
>>> +
>>> +				/* Atheros AR9287 */
>>> +				wifi@0,0 {
>>> +					compatible = "pci168c,002e";
>>> +					reg = <0000 0 0 0 0>;
>>> +				};
>>> +			};
>>> +
>>> +			pcie@3,0 {
>>> +				status = "okay";
>>> +
>>> +				/* Qualcomm Atheros QCA9880 */
>>> +				wifi@0,0 {
>>> +					compatible = "qcom,ath10k";
>>> +					reg = <0000 0 0 0 0>;
>>> +				};
>>> +			};
>>> +		};
>>> +	};
>> These are not wrong, but they are also not needed. PCI devices should
>> be discovered by enumeration, and you don't have any additional
>> properties here, or phandles pointing to these nodes.
>>
>> I assume these are COTS wifi modules? By listing them here you are
>> restricting some flexibility. The OEM could for example swap the
>> modules around, and Linux would not care, but the DT would then be
>> wrong. Or you could have a device with a different module because it
>> is cheaper, and again, Linux would not care, but the DT would be
>> wrong.
>
> Got it. SA-W2 is not designed to allow users to swap cards under 
> normal use, but certainly things like you said can happen...
> I'll remove "wifi" nodes.
>
>  > I assume these are COTS wifi modules?
>
> Yes, those are the modules manufactured by Silex Technology, Inc. [1][2].
>
> [1]: https://www.silex.jp/products/wireless-module/sxpcegn.html
> [2]: https://www.silex.jp/products/wireless-module/sxpceac.html
>
>>
>>> +&usb0 {
>>> +	pinctrl-names = "default";
>>> +	pinctrl-0 = <&pmx_usb_pins>;
>>> +	status = "okay";
>>> +	#address-cells = <1>;
>>> +	#size-cells = <0>;
>>> +
>>> +	/* SMSC USB2514B */
>>> +	hub@1 {
>>> +		compatible = "usb424,2514";
>>> +		reg = <1>;
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		hub_port1: port@1 {
>>> +			reg = <1>;
>>> +			#trigger-source-cells = <0>;
>>> +		};
>>> +
>>> +		hub_port2: port@2 {
>>> +			reg = <2>;
>>> +			#trigger-source-cells = <0>;
>>> +		};
>>> +	};
>>> +};
>> Same comment as PCI. However, it is likely that the USB hub is
>> actually on the board, not a module, so it is a lot less likely to
>> change.
>
> Yes, that USB hub is on the PCB and wired to the SoC directly. But 
> I'll keep it in mind...
>
>>
>> As i said, they are not wrong, so you don't need to remove them.
>>
>> 	Andrew
>>
>
> Regards,
> Hiroshi

-- 
Gregory Clement, Bootlin
Embedded Linux and Kernel engineering
http://bootlin.com
