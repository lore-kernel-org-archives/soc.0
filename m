Return-Path: <SRS0=27v0=6U=gmail.com=musashino.open@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EEAC61DA3
	for <soc@archiver.kernel.org>; Fri, 24 Feb 2023 12:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AF815C433EF; Fri, 24 Feb 2023 12:58:03 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AE6DAC433D2;
	Fri, 24 Feb 2023 12:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AE6DAC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id z2so16806651plf.12;
        Fri, 24 Feb 2023 04:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677243482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CXtEyT8xVIkUMApBSTQ3cYy66lfTrvRLYpoVJHa9vcs=;
        b=fGNjMXdOa/2jFDtcv4zjh5C+rTTvUkujg/MH7jVU3TzF9pgNNfvHMmhe9KdoxBz/IP
         nmztiOBlWTPhe8cRXO284AFl+WeBp8e9PutPukzpzZTijXvU5PcC9Nwy+uMv/Mg7/qtq
         65O0QVE2iGRv7s6zI0/YqQm+oO4XGzzePhfEJTl4EHbLKkdZRyyrGgetPgQYcn5MyOt0
         nWXkaJhYVsiaj+Q125hN1AqIJe9XEGJAPYQOZDSmCVkg9j/6QVnGvmRJ4xPlwhoxDCJb
         vwEnSRVIkmlUamNSmoPcmYEFDgUuf7R29/rCGuSskTxzfp6gAWVsKMS24m6VaAWqb/kB
         sQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677243482;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CXtEyT8xVIkUMApBSTQ3cYy66lfTrvRLYpoVJHa9vcs=;
        b=UVVYFkpGzky6+/EZpHfDsu+87vjX0Rn0Zz9eYwimGL0WuWRc5w5g/fNzx318dYiuaa
         V5/2HdZm9xfhaiQf/gViXQ2EHNa+HhQSfXrFpnPRsm/mzcnDTtqPWOTG081OBppZIpkz
         Fo9iNMBANCkPZnVNohiYuT5ynFneevrCddLBtMTUsXcsm9vhtwL09p71DBMGihmtXsQP
         mSdzAK1bjBBN1KZbQ4Y0s3bNlciwM1WK8xc3ptHjNhNTGQuaN3gnrjtwjo0MT/gUVBHT
         Mw7I0kqByvwblWymEeN4OUGOkS0h8C9J8+mBqtu5RPlyRiCQxts0DoOlAKi2rq/PAOaR
         fs5w==
X-Gm-Message-State: AO0yUKVj1xV1PQny7mqjDE+pQt9OPcV39djGTerTQ54gZbfUokFZnh7O
	qfaQvqvOD1ksT2LhEeyuVWc=
X-Google-Smtp-Source: AK7set+YzXg/RfEEChGbQ+6UrrWMwrZYY/kX2hO/BsunvHndn5j3QyvNXnxK3qAajg7VWTkoh4nCsg==
X-Received: by 2002:a17:902:d2cd:b0:19a:98fd:9c54 with SMTP id n13-20020a170902d2cd00b0019a98fd9c54mr19495973plc.35.1677243482019;
        Fri, 24 Feb 2023 04:58:02 -0800 (PST)
Received: from [192.168.1.39] (M014008005000.v4.enabler.ne.jp. [14.8.5.0])
        by smtp.gmail.com with ESMTPSA id d2-20020a170902654200b0019a74841c9bsm6409474pln.192.2023.02.24.04.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Feb 2023 04:58:01 -0800 (PST)
Message-ID: <7d4a218d-8b8a-5a1d-eff8-e154bfde69be@gmail.com>
Date: Fri, 24 Feb 2023 21:57:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] ARM: dts: mvebu: add device tree for IIJ SA-W2
 appliance
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>
List-Id: <soc.lore.kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, gregory.clement@bootlin.com,
 sebastian.hesselbarth@gmail.com, arnd@arndb.de, olof@lixom.net,
 soc@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20230223132502.2045-1-musashino.open@gmail.com>
 <20230223132502.2045-2-musashino.open@gmail.com> <Y/d7gjqQCKKXMHqj@lunn.ch>
From: INAGAKI Hiroshi <musashino.open@gmail.com>
In-Reply-To: <Y/d7gjqQCKKXMHqj@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

thank you for your reviews and detailed descriptions.

On 2023/02/23 23:43, Andrew Lunn wrote:
>> +		pcie {
>> +			status = "okay";
>> +
>> +			pcie@1,0 {
>> +				status = "okay";
>> +
>> +				/* Atheros AR9287 */
>> +				wifi@0,0 {
>> +					compatible = "pci168c,002e";
>> +					reg = <0000 0 0 0 0>;
>> +				};
>> +			};
>> +
>> +			pcie@3,0 {
>> +				status = "okay";
>> +
>> +				/* Qualcomm Atheros QCA9880 */
>> +				wifi@0,0 {
>> +					compatible = "qcom,ath10k";
>> +					reg = <0000 0 0 0 0>;
>> +				};
>> +			};
>> +		};
>> +	};
> These are not wrong, but they are also not needed. PCI devices should
> be discovered by enumeration, and you don't have any additional
> properties here, or phandles pointing to these nodes.
>
> I assume these are COTS wifi modules? By listing them here you are
> restricting some flexibility. The OEM could for example swap the
> modules around, and Linux would not care, but the DT would then be
> wrong. Or you could have a device with a different module because it
> is cheaper, and again, Linux would not care, but the DT would be
> wrong.

Got it. SA-W2 is not designed to allow users to swap cards under 
normal use, but certainly things like you said can happen...
I'll remove "wifi" nodes.

 > I assume these are COTS wifi modules?

Yes, those are the modules manufactured by Silex Technology, Inc. [1][2].

[1]: https://www.silex.jp/products/wireless-module/sxpcegn.html
[2]: https://www.silex.jp/products/wireless-module/sxpceac.html

>
>> +&usb0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pmx_usb_pins>;
>> +	status = "okay";
>> +	#address-cells = <1>;
>> +	#size-cells = <0>;
>> +
>> +	/* SMSC USB2514B */
>> +	hub@1 {
>> +		compatible = "usb424,2514";
>> +		reg = <1>;
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		hub_port1: port@1 {
>> +			reg = <1>;
>> +			#trigger-source-cells = <0>;
>> +		};
>> +
>> +		hub_port2: port@2 {
>> +			reg = <2>;
>> +			#trigger-source-cells = <0>;
>> +		};
>> +	};
>> +};
> Same comment as PCI. However, it is likely that the USB hub is
> actually on the board, not a module, so it is a lot less likely to
> change.

Yes, that USB hub is on the PCB and wired to the SoC directly. But 
I'll keep it in mind...

>
> As i said, they are not wrong, so you don't need to remove them.
>
> 	Andrew
>

Regards,
Hiroshi
