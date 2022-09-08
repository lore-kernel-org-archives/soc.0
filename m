Return-Path: <SRS0=e7uF=ZL=linaro.org=naresh.kamboju@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29AEC54EE9
	for <soc@archiver.kernel.org>; Thu,  8 Sep 2022 11:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 83E2AC433D6; Thu,  8 Sep 2022 11:05:03 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7ECB2C433C1
	for <soc@kernel.org>; Thu,  8 Sep 2022 11:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7ECB2C433C1
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f171.google.com with SMTP id g4so2390635pgc.0
        for <soc@kernel.org>; Thu, 08 Sep 2022 04:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WMsQMSX1hfTe9BFmiTHvFAjUCeXT/Sdp4+/k8oeGDSU=;
        b=x9H0iQ3XtO0RguDELrJ2jhxEab22MuIWWVcGxj+8aV9oS97z1hCG9QLWKTVI9e3ern
         CoEXl5u8BoLDnM4fie5AvPQw8dfV/6kxxDRjZhbG83rcYflxYCe8L9PmcDwamSJHd6ti
         pmR72MOckd3/JnwbFEhuej/HpjD2Bx9R2JA7JIbS7kYiIam9aThTcoEun1QdUKRQwVIx
         9yPyc+7EgdKh4yFksOIp9e8HjB+DVUM7J25HvLrOobyFBZ02RGJdX6+/0H1ywvgHGh+4
         vqKRIQR8zGKC9VKSj1yxAF0rl7XPmmiHbagNRkJnCW4tY5tNUne6C4BvjUKGPuNDYvRY
         fvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WMsQMSX1hfTe9BFmiTHvFAjUCeXT/Sdp4+/k8oeGDSU=;
        b=yZLPxjw0smXKDvRi2Xt07tfot8D+gmCaRPi2rSjO0hct+Fm02pDS8CecEqi3B+bH2X
         4jg36nQW7yP2rXtgZo8TWPEqVZ/0FCVeSYzgePjMKZHD2DqM5V1vJJz+B6PjS50zu/Vx
         nW4t1eUHDVi1ejXH5mET48LfLzxYcNOxT/7qz86iBVC8XiyHara5G0NWHdk1cYXm98Ek
         6XCsvxtF5B9hD4LEBTYejCbAZoGkyhh3my35qSjiNc77ry//iYAAiOU3h5NGiuW4Fajc
         T8vClG1RVCUPxh89+2my0u75VN/1kngFqNLQ3pQtV8IsA94ftwBF929W1NzbaRlO5Ucs
         T9bQ==
X-Gm-Message-State: ACgBeo1FaD/FpLWFh6dO2jmks7P+xRt8h3TaUOUe/to4FwPNPxucxoMh
	DCCTV2714utPKy7u+zF51K2cdw==
X-Google-Smtp-Source: AA6agR6ujvV1j0Sqsy7/cnqFqwHILNPTNuLZxWGMAPxKylDgw0q7HDxUlXoOGRl2S1cIrBBZhoTKRA==
X-Received: by 2002:a63:df14:0:b0:42b:484c:4273 with SMTP id u20-20020a63df14000000b0042b484c4273mr7264437pgg.186.1662635101819;
        Thu, 08 Sep 2022 04:05:01 -0700 (PDT)
Received: from localhost.localdomain ([124.123.189.206])
        by smtp.gmail.com with ESMTPSA id b6-20020a170903228600b00174a4bcefc7sm14426395plh.217.2022.09.08.04.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 04:05:00 -0700 (PDT)
From: Naresh Kamboju <naresh.kamboju@linaro.org>
To: f.fainelli@gmail.com
List-Id: <soc.lore.kernel.org>
Cc: anand.gore@broadcom.com,
	arnd@arndb.de,
	bcm-kernel-feedback-list@broadcom.com,
	catalin.marinas@arm.com,
	krzysztof.kozlowski@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	olof@lixom.net,
	soc@kernel.org,
	will@kernel.org,
	william.zhang@broadcom.com,
	anders.roxell@linaro.org,
	lkft@linaro.org
Subject: Re: arm64: Kconfig.platforms: Re-organized Broadcom menu
Date: Thu,  8 Sep 2022 16:34:51 +0530
Message-Id: <20220908110451.66564-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220712164235.40293-1-f.fainelli@gmail.com>
References: <20220712164235.40293-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lkft@linaro.org

LKFT test farm found that Linux next-20220906 onwards the Broadcom DTB
builds are not happening. And after bisecting we found this patch is
the reason [1].

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

FYI, We have not changed any kernel configs.
[1] http://ix.io/49Wq


--
Linaro LKFT
https://lkft.linaro.org
