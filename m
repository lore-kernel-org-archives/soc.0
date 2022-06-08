Return-Path: <SRS0=cZg1=WP=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82282C43334
	for <soc@archiver.kernel.org>; Wed,  8 Jun 2022 09:19:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4E61FC3411C; Wed,  8 Jun 2022 09:19:57 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ACB1DC34116;
	Wed,  8 Jun 2022 09:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ACB1DC34116
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f52.google.com with SMTP id k4so19132500vsp.3;
        Wed, 08 Jun 2022 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/VQUCDn34E17XXsnPnnfZCFOxTViuV31TOkFWFDSdOw=;
        b=f0X/bujXGwJ+MmEAkd0qotOhcFoiRSEQeAhO+ZT6ZKqdm65ykalxwo7PP/j3nei3NA
         sd5uWGmtDDKJ5e6YaHOOIRqPaXz0yfVKblGRdte3reIZn4CHGNq3K2OmALBOSItGlaQ8
         QyU+sd7ZsP5/pQ+xVGrmuBGFDfsY2V6kfmJU2bvfdEamgrMN017PxabFWSlG3yydmHGq
         XkHAnh+AyugJbr3JTj4IMKGVdcayognpsFZz0LhdKbrYNhJnLpMOg1GVnn+6+GB/prLt
         a84AMwNlojKBya+wXBei30DbF1UGcbgHbutwfL8vBlY51PC5cIKacGhGXTC8aT9JBXL3
         xhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/VQUCDn34E17XXsnPnnfZCFOxTViuV31TOkFWFDSdOw=;
        b=wMH7cAXWBaF8r/t8rTcaqehUCqlRjJOsagfyIiLEnOhikRxReVf76R/IbTLc/hYau/
         0O3LfEjQvWRtBgt0JM+4OdQ48q8sQVr3wRD+D6ZwQspPAONo0rHh17nn33oEv/Lwp83w
         aCWDKYOW18bZ3eMPNyAwmRyPKLZKLwFDEGq8MprmFkh08f46j7OA0UhO4fsoF+qmVTfj
         OQ9xGSN//oCalZ3XBdsCaLqAYRPui64mMYamO9E0KOxl/4GaHMz1/dX0OgAwYZulbU8t
         CX120dhERf/iF59DF9fQ3oAk2xekJ8A5Xq1hs4EyZGtrwTld61ZEnWWfiD+gJXqHjGzD
         wPyA==
X-Gm-Message-State: AOAM530y/frSagwoGj8x2p+YHlKzYghtTdB7RAwqx1GddMBcW3I3Tg+l
	bdVtZuXEzCEF6xcSa8L9Iho=
X-Google-Smtp-Source: ABdhPJzs1KUFTE0j4mzpuEPdj5w2Uv1REGhxWfscyAt1j63j9Ch8txeCMY2hWDHxFSNSmqBmdbHr3A==
X-Received: by 2002:a05:6102:5c3:b0:349:e2e3:9f44 with SMTP id v3-20020a05610205c300b00349e2e39f44mr17962403vsf.57.1654679995580;
        Wed, 08 Jun 2022 02:19:55 -0700 (PDT)
Received: from [192.168.0.24] ([88.126.57.132])
        by smtp.gmail.com with ESMTPSA id s11-20020a67ce0b000000b0034bbe2e0b56sm825462vsl.20.2022.06.08.02.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jun 2022 02:19:54 -0700 (PDT)
Message-ID: <96408912-aaa3-ba55-cdfb-3e316ae6e324@gmail.com>
Date: Wed, 8 Jun 2022 11:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/3] arm: bcmbca: add bcm6846 SoC support
Content-Language: en-US
To: William Zhang <william.zhang@broadcom.com>,
 Linux ARM List <linux-arm-kernel@lists.infradead.org>
List-Id: <soc.lore.kernel.org>
Cc: anand.gore@broadcom.com, dan.beygelman@broadcom.com,
 joel.peshkin@broadcom.com, tomer.yacoby@broadcom.com,
 kursad.oney@broadcom.com, samyon.furman@broadcom.com,
 philippe.reynes@softathome.com, Arnd Bergmann <arnd@arndb.de>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Olof Johansson <olof@lixom.net>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, soc@kernel.org
References: <20220601022215.32494-1-william.zhang@broadcom.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20220601022215.32494-1-william.zhang@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/1/2022 4:22 AM, William Zhang wrote:
> This change adds the basic support for Broadcom's ARMv7 based
> Broadband SoC BCM6846. The initial support includes a bare-bone dts
> for dual core ARM A7 with a Broadcom uart.
> 
> Changes in v3:
> - Simplify dt-bindings patch subject line
> - Fix timer PPI interrupt cpu mask for dual core cpu
> - Remove unnecessary cpu_on and cpu_off properties from psci node
> - Add the missing gic registers and interrupts property to gic node
> 
> Changes in v2:
> - Add new line between entries

Series applied, thanks William! I will comment on the VFP fixup separately.
-- 
Florian
