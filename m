Return-Path: <SRS0=CL8n=VL=gmail.com=f.fainelli@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8EFC433EF
	for <soc@archiver.kernel.org>; Tue,  3 May 2022 22:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD308C385A9; Tue,  3 May 2022 22:02:15 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 026A0C385AE;
	Tue,  3 May 2022 22:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 026A0C385AE
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id v11so6347205pff.6;
        Tue, 03 May 2022 15:02:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BML3fCwKAkemWPuJ7hEIxFoVzk3CNeF2ywdelTSnmIQ=;
        b=owiQWKJ4ZQJAcwCHFiQaYjtX3YmVXpcq8zcYGfq/c9VRE6z6kbjmjaRH1GrbY3bjrq
         m/dKA+gBL/bv5dD9qStTUM1WA6v3jrmw9ghlDfVH7F0L9aZ05LSHkJkuBDxtL7nTITSE
         t1xYE14wP20tl3mvkN7YTu5TdPyyPYvgPWEg1icBb/BeYxWjdD4KzNcSCeC0YRAam2EM
         AZ1IQJoMrXOVmYDPutlC/o/3kQbYTEmpXY5lq1Cyt3X9b0OKlagbWAjVp0GO+vlqEnWF
         SnGjLXHe46VAqMbWCyDdHS082T8hCuIX1Oip0+RLYnJHxB4wUAajIR07X2DAgx+wB+6K
         /40Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BML3fCwKAkemWPuJ7hEIxFoVzk3CNeF2ywdelTSnmIQ=;
        b=m4MeuOCRsiV3SdVR+4a1g/b+P3T1yLfyQbK9itBR8JsSF5OlXb9N7NUdsHnVFPBqXF
         LT0IMKnewBP/OYnNuWiWwfsKvpRx9wIaIrmWgz8MDYjcxVCnDR2zjRmOAUbwUtR+2ctm
         fOKePzfRY69PS5Do8jNOkozDGGVEjfvoKU7j2S/YhFUh20/B84Fam5UUPIPVddn9ozAb
         40qnLYZaSdIHRJttP/x3TWgsI4IT6Muh10mNbIuJIabOwCPD8osqWRz1BUPYNbcWDsYi
         tm7GMX7mU0SKX+teP5aqO5ViVqTHJ8+DXw8KbpUas+dx+GxY7330/jgHpwg14hqayS2v
         etJA==
X-Gm-Message-State: AOAM530yRO8rzhEzKYI9Q05nsOymD8EEtB2220Njuqi4ZWY7CVtu0vZC
	BA3xHlY4Tp4U/nVK5wpbqzjqmjZIEFI=
X-Google-Smtp-Source: ABdhPJzP6mUzXABdoFH1ZVeSaq/TMAPgJIb1k9QSNLAFmv5nzlKhGgUDeL8CPA1fwrylMwXwwXOOJg==
X-Received: by 2002:a63:cc53:0:b0:372:7d69:49fb with SMTP id q19-20020a63cc53000000b003727d6949fbmr15398440pgi.21.1651615334498;
        Tue, 03 May 2022 15:02:14 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id t5-20020a170902b20500b0015e8d4eb29asm6794268plr.228.2022.05.03.15.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 15:02:14 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: bcm-kernel-feedback-list@broadcom.com,
	SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com>
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	soc@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?iso-8859-2?q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: BCM5301X: Add DT for WZR-1166DHP,DHP2
Date: Tue,  3 May 2022 15:02:12 -0700
Message-Id: <20220503220212.1676263-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421151055.6851-1-takayoshi.shimamoto.360@gmail.com>
References: <20220421151055.6851-1-takayoshi.shimamoto.360@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 22 Apr 2022 00:10:54 +0900, SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com> wrote:
>   Buffalo WZR-1166DHP/WZR-1166DHP2  wireless router with
> 
>     - BCM4708A0
>     - 128MiB NAND flash
>     - 2T2R 11ac/a/b/g/n Wi-Fi
>     - 4x 10/100/1000M ethernet switch
>     - 1x USB 3.0 port
> 
>   WZR-1166DHP and WZR-1166DHP2 have different memory capacity.
> 
>   WZR-1166DHP
>     - 512 MiB DDR2 SDRAM
> 
>   WZR-1166DHP2
>     - 256 MiB DDR2 SDRAM
> 
>   These hardware components are very similar to the WZR-1750DHP
>    except for the number of antennas.
> 
> Signed-off-by: SHIMAMOTO Takayoshi <takayoshi.shimamoto.360@gmail.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
