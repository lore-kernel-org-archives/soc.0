Return-Path: <SRS0=/0Rs=SH=canonical.com=krzysztof.kozlowski@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95E5C433F5
	for <soc@archiver.kernel.org>; Sun, 23 Jan 2022 12:00:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 68ECBC340E5; Sun, 23 Jan 2022 12:00:57 +0000 (UTC)
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DD8EC340E3
	for <soc@kernel.org>; Sun, 23 Jan 2022 12:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7DD8EC340E3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3CA363FFFD
	for <soc@kernel.org>; Sun, 23 Jan 2022 12:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1642939255;
	bh=R8ld3KGRh1s+PUP/6LYVXFBTzLHQGuxsTJ6zIDEbsbs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=o/VqrNFmJFfYQqD455PZf4w+ggELaM0myKV13TPtlHsT113UF8O+1OIUuhJpIfOyP
	 A0aFzjIEc1RwDlwmw9EJseAF3lQEcJJOefOBEOdd2hGNO15KTUplhGW3oDEjnV8CFj
	 RBmNr7DcyPAAwP/VYiAU3BYW32SUX6vdOLU94J11NbA0u+rfYUNI2i5a55VM4oe+Kv
	 sQkbyy6rK9UmfN/S4slpZ2exB0L/UFORry9x40rfYD6Q9VYyXe+eq4q4oM2Z6AHM6L
	 r/d4YyYx0x0tHEOAjRJHpSmroe5/FWj7p80Agkyu+GvuZRXBT4WINJQdm/vg1ye18t
	 9JYnqdI7UJ6dQ==
Received: by mail-ed1-f69.google.com with SMTP id eg24-20020a056402289800b00407f95c4c35so770545edb.10
        for <soc@kernel.org>; Sun, 23 Jan 2022 04:00:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=R8ld3KGRh1s+PUP/6LYVXFBTzLHQGuxsTJ6zIDEbsbs=;
        b=6nCJU5p1LqDLzMRiSpPbFufc7y9RBQjvBut7K9fi7N16hmeg+IZVrimqr4M3NhAuGY
         7WIjO0Zexzu5imEwxZQPV9nEqvWjhXCLJu357udXfIoW4HNVnSsGuwmSAAWElfF+N/h4
         MACuv/NWIUzVQmslHK04Jj8z2qetvWGDk/ccDUTdd/sYzWB8lkhK0/eBtrYqA1cn5xe6
         ocv8QL03hZoPbv1ItcdtZlPayJGrwmpNnoRJrDFQMyHec8K/XVbxw+3DKI3vIBDCy+hf
         hQZrvImn8xUM8QRINs+SUzuk7iGLYO6LEvrQSYZwUKFxsqcTLuN3s2fbpCo9JTJU7EcO
         J0sA==
X-Gm-Message-State: AOAM5328IjZrEGNEg5baigI0jVwQ8pmFvmotkbAwFfIVfMjv/+PTXD5x
	2aySOg+vD6ztR1uZcmxHIrmCnj8rmZKxl88OxZI/vBQSQ/giMRVttjrfLJc83SBlfxuXYB/8VuL
	kbKaZoSoeVB/cirO2wV9tIvA=
X-Received: by 2002:a17:906:5d12:: with SMTP id g18mr1368623ejt.564.1642939254573;
        Sun, 23 Jan 2022 04:00:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeTB3suFnHuSqPCxxt4hqTrIWZZhoJ1FzeZKkPW/SXb8l19G3YdxLLqBAE1J6RZw+usdjIrw==
X-Received: by 2002:a17:906:5d12:: with SMTP id g18mr1368617ejt.564.1642939254409;
        Sun, 23 Jan 2022 04:00:54 -0800 (PST)
Received: from [192.168.0.52] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id g12sm4910525edv.89.2022.01.23.04.00.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jan 2022 04:00:53 -0800 (PST)
Message-ID: <724c16d2-5afc-4d41-8d84-3ba570d14cee@canonical.com>
Date: Sun, 23 Jan 2022 13:00:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [GIT PULL 1/2] memory: drivers for v5.17
Content-Language: en-US
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20211224111124.6097-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211224111124.6097-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/12/2021 12:11, Krzysztof Kozlowski wrote:
> The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:
> 
>   Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git tags/memory-controller-drv-5.17
> 
> for you to fetch changes up to de369801658a9a54759ac011af770e8c01d9db7f:
> 
>   Merge branch 'for-v5.17/tegra-mc' into mem-ctrl-next (2021-12-22 12:59:03 +0100)
> 
> ----------------------------------------------------------------
> Memory controller drivers for v5.17
> 
> 1. Minor improvements: Mediatek SMI, Freescale/NXP IFC, Tegra20 and
>    Tegra30.
> 2. Convert Freescale/NXP IFC bindings to dtschema.
> 
> ----------------------------------------------------------------
> AngeloGioacchino Del Regno (1):
>       memory: mtk-smi: Use ARRAY_SIZE to define MTK_SMI_CLK_NR_MAX
> 
> Dmitry Osipenko (2):
>       memory: tegra30-emc: Print additional memory info
>       memory: tegra20-emc: Correct memory device mask
> 
> Jason Wang (1):
>       memory: brcmstb_dpfe: fix typo in a comment
> 
> Krzysztof Kozlowski (1):
>       Merge branch 'for-v5.17/tegra-mc' into mem-ctrl-next
> 
> Li Yang (2):
>       dt-bindings: memory: fsl: convert ifc binding to yaml schema
>       memory: fsl_ifc: populate child devices without relying on simple-bus
> 
> Rikard Falkeborn (1):
>       memory: tegra: Constify struct thermal_cooling_device_ops
> 

Arnd, Olof,

I think this one was not pulled by you. Any chances of sending this to
Linus past 5.17-rc1? If not, could you pull it as v5.18 material?


Best regards,
Krzysztof
