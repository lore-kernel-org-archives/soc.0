Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5431E8322
	for <soc@lists.linux.dev>; Fri, 18 Jul 2025 06:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752819279; cv=none; b=X7QcpMLx2iY+lYKZ0XmL19Jt/Rcq+y64YNV2UJUx54Pwr48h+QSTWldDv7hKXzdH2qU3zgpI6UD3d41zAa5Fym+UdsHGQEUKhJnXjp+B+imL2s4+YiCx3XkokcOpV+qo6eF7EYISM+cLmG/K7qIjyyJ6RZYMz5H1r2cWtXvpZlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752819279; c=relaxed/simple;
	bh=6S+y/P+II8gQtXm108YJxIXK9ZODMt2aLQR6rh2xuDk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bJ4ntTyoGZ3fODU342lLD8/SeM8q3MeISxRKm3Vr+DjmbydXJzLhQ3DC84U0h1Sfu67p6OG502wW2Pw34C6PWWnOJicosk8cgbYA7fI7yYRDlRbj4XxSMGHet2LrTg5FxaUgf7l1zi9K4xwUgsb5VfJKcHpgGHx3J2qXgAgdhsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xc/7HiEK; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xc/7HiEK"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-606a269d440so336428a12.2
        for <soc@lists.linux.dev>; Thu, 17 Jul 2025 23:14:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752819276; x=1753424076; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VWiqtcrm3UpqYWicE+Qr3IVBY26YZu591zaNb17vRzc=;
        b=Xc/7HiEKTUxHKdHRa0WpwTRyPcSHV3AScZd3oKM7ag094bPJ4OcWWZjn3vUvqSMigJ
         6VUJ8OOac9MaI6PUVts2hylGoUfB0+lVM90LgDQVCa3hRmvIFLlbXUQQpq1n7+2Gzna+
         +ZqTUoQnSBCDi5IlsoKzGWzGdecP3p6Mwx6Rq978v+UGSaEt542wPdtwJgCHyzXTLDcy
         aG/dH0ejE5f989Rl7tfzzZrcixk0DzYv4Y6I4KdaJsC0X1FliMsS8Ovq9+EiPJ49Sk3E
         dYS5GMi/0GCcdoXXDTsj3FYjAFGKK/9zMcrAeww0YokW9F57mTI+ZBPaWagd4yPyaHyJ
         u2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752819276; x=1753424076;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VWiqtcrm3UpqYWicE+Qr3IVBY26YZu591zaNb17vRzc=;
        b=TNqw+rnUwhpyt1KgWI8wR+0skZWetgjThWCKhe+SsTo3o5Ry6Rc5n7YdEaYe0hHhT9
         oTyLRSDGaQ+7OKxKGyKOpVGREGinGo9z9vNtI7xPwyc/yDpLR4mroZMRsA/PwGxFFTtA
         5JR6ghNQWAvM/W8at8ItFuM0qDrpUrNpXb5J7SWgOf3U2eH6fjOqAY2gDxrlfm5Y/9A5
         ZPzitjPyFOSQNzqczbD6IGSXu55QH77MQEduhkj+5OWxCmKv5FIsFcg4E2tXeUvslRuE
         ed0TFz0OVZFMYU3Ego50ISPt0/vorqnvv61QfTDuoE99s36mrSojYI2f0uTHXEQKYzzX
         /Z8A==
X-Forwarded-Encrypted: i=1; AJvYcCWFVrnVkm0K/wPx8R24jxhwUNIsDBdi+tHweQfmiBaToWA99HQcbwVodeUa3C7IQslM3j8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmoqWgpx8Q9BgHOPkhXiSoXI1wahlM93cMsLxW+7I/Oz9HNQ/y
	/X38ypBkKKTmUXTcUB1/5B037C50reTPg9RyzG+iJrZteynvcPoTETgY2TgxvE3Tva8=
X-Gm-Gg: ASbGncu2jVJqSRsRoOJPizX4/2/fg3eVwoz1+E28Dm9JJLIZUbE+C+Hc88e2dxDJQ04
	C1RF+jsZoHOGjJh65mjfJwEdQ+TZjYJ9g0cbCKM9hb7yGRErWCUKHGgBdA0B0zpwHaKigTiFMQJ
	JrrfABA/qSir+/wUkflaTDlvqHE2eWZh4GZkQEGxvkymBfN6AHsoyR/G9vxqC0zjqmNg1lSanXO
	GBZHm06BSHv+TQyuj5p6RDDLbRZVESzef1yTQajJNpXjMr1x5Leu9n67SOYynviflwFwb8Nd7rC
	VU1ZDX1bH2vkrLHyYaqraeBfxFm0F+l6yeigEzKtka4YAJpmxMCTagrVtmW4ITb8ka6LwlVFpWw
	C8jh+3LzLaRsCERcb0Tzfpjl6W8cQhYQulg0yghJmIAsvHIHX+/qA
X-Google-Smtp-Source: AGHT+IE9LoG3p8nLyIseKLpQcssOqg7w3tMU8M2AmWdPDwMRm5y5MbuuS+ZNv4TcdwiluHmo/FRJ9Q==
X-Received: by 2002:a05:6402:4019:b0:612:bd30:d320 with SMTP id 4fb4d7f45d1cf-612bd30d674mr1047426a12.6.1752819276028;
        Thu, 17 Jul 2025 23:14:36 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c90d671bsm476342a12.73.2025.07.17.23.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 23:14:35 -0700 (PDT)
Message-ID: <e461e5ed-f512-4d3b-9903-8092dab7f81d@linaro.org>
Date: Fri, 18 Jul 2025 08:14:33 +0200
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/10] Axiado AX3000 SoC and Evaluation Board Support
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jan Kotas <jank@cadence.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>,
 Michal Simek <michal.simek@amd.com>, =?UTF-8?Q?Przemys=C5=82aw_Gaj?=
 <pgaj@cadence.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Boris Brezillon <bbrezillon@kernel.org>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>,
 "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
References: <20250703-axiado-ax3000-soc-and-evaluation-board-support-v6-0-cebd810e7e26@axiado.com>
 <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <b7322d03-2ff9-48a3-bdc6-0e95382ed83f@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18/07/2025 01:48, Harshit Shah wrote:
> On 7/3/2025 11:20 AM, Harshit Shah wrote:
>> CAUTION: This email originated from outside of the organization. Do not click links or open attachments unless you recognize the sender and know the content is safe.
>>
>>
>> This patch series adds initial support for the Axiado AX3000 SoC and its
>> evaluation board.
>>
>> The AX3000 is a multi-core system-on-chip featuring four ARM Cortex-A53
>> cores, secure vault, hardware firewall, and AI acceleration engines. This
>> initial support enables basic bring-up of the SoC and evaluation platform
>> with CPU, timer, UART, and I3C functionality.
>>
>> The series begins by adding the "axiado" vendor prefix and compatible
>> strings for the SoC and board. It then introduces the device tree files
>> and minimal ARCH_AXIADO platform support in arm64.
>>
>> Patch breakdown:
>>    - Patch 1 add the vendor prefix entry
>>    - Patch 2 document the SoC and board bindings
>>    - Patch 3 convert cdns,gpio.txt to gpio-cdns.yaml
>>    - Patch 4 add binding for ax3000 gpio controller
>>    - Patch 5 add binding for ax3000 uart controller
>>    - Patch 6 add binding for ax3000 i3c controller
>>    - Patch 7 add Axiado SoC family
>>    - Patch 8 add device tree for the ax3000 & ax3000-evk
>>    - Patch 9 add ARCH_AXIADO in defconfig
>>    - Patch 10 update MAINTAINERS file
> 
> Hi all,
> 
> This patch series was reviewed by Krzysztof, and I am wondering if it’s 
> queued for the next merge window. Thanks in advance!

It's not, unless you received clear notice about it. Please read
maintainer soc profile how to send patches for merging.

Best regards,
Krzysztof
