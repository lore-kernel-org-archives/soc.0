Return-Path: <SRS0=cfCK=XN=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C10C43334
	for <soc@archiver.kernel.org>; Fri,  8 Jul 2022 18:56:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 04608C341CB; Fri,  8 Jul 2022 18:56:16 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3DF53C341C0;
	Fri,  8 Jul 2022 18:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3DF53C341C0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id sb34so39088815ejc.11;
        Fri, 08 Jul 2022 11:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRYIx80qdKmzRctOou8xam0gu9RHS40xRv10uoapvYs=;
        b=GMJBWXg556ODFg1/ApAUP5GYYjY14xfzfznUVhXitno80MAFgkMcHw4z154kht5wvO
         FMeFycAM3PlpYfpVkbAo4KTv4OI+daiiaoUakn6qZ1lVJE7w9L2zFO1zf7TTDGYDAnz9
         ailGY6oyDRlvSyMRgXhJgjbg0JwvTdR3crC46Ht239vhLAh0jSEFDv1NLMu3og/tiRPv
         sOl/7CzYJO8pRrzFaMUzDqG7eBpdcutdHJQRtn/6MfTvY9tEhhVuU5tpFwvi5kwMT0h+
         veqNFUc4tLVPNe+u2m00umfJVDI6edUcJ0fDPENjtRxF8lybmPesZFXYloYjbpjVF/Vl
         mQOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRYIx80qdKmzRctOou8xam0gu9RHS40xRv10uoapvYs=;
        b=3omnC62pwPHLIF+sQkhBuBILCk9Bxa7w5CmExIlJsfHCxq+/SxxjoWBRTJLgl4gi76
         6TTfRPwEk4kCydeFUS02yKYGnMp5uXOehJlXnOfa8ezeEhfW6vr+OqhGSafDWEDrKOX0
         Vs+cF0L775CQae/+3p1hHQ3Az4PNR8kHOYSALYyFH7RHQ07Eg5Qm1z9hKwji1o/eOvLL
         Cf8V1w2FRca71NyBeivKtS2aCCEFnRXnskM1nVgjzfKlyaHOpdbKbiGROByNecffFnzQ
         Dh4OkSEDgRm5b9DjN8+6Q9qvTx02p13echfdKncOUSwHY8B3Gb7KjPSAwGv45LDV8D5r
         FvHw==
X-Gm-Message-State: AJIora+B/m133I8N/tJXZQ6Y6/5D0nyBg2yDSHDTpCd+gFsOb0Kp0rn9
	ixN6IUJkfvEwRsQPhJY4SNDOsQXrnnQ=
X-Google-Smtp-Source: AGRyM1sX0SUidsuvfN5IatjAuoyijwMulWE//lmBOY9ijGDRQfBgH/VT59UfTzjXLiWkY7KP3sfqFQ==
X-Received: by 2002:a17:907:7f8e:b0:712:f503:1a56 with SMTP id qk14-20020a1709077f8e00b00712f5031a56mr4779244ejc.364.1657306573068;
        Fri, 08 Jul 2022 11:56:13 -0700 (PDT)
Received: from localhost (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id d7-20020a170906304700b006fe921fcb2dsm4413565ejd.49.2022.07.08.11.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 11:56:12 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 0/7] NVIDIA Tegra changes for v5.20-rc1
Date: Fri,  8 Jul 2022 20:56:01 +0200
Message-Id: <20220708185608.676474-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

here's a set of Tegra pull requests for v5.20-rc1.

One thing that I would very much have liked to include in this is the
Multi-Gigabit Ethernet (MGBE) controller support for Tegra234. That's
very important because it unlocks much broader coverage using our test
farms and makes the devices generally a lot more useful. Unfortunately
there were some unforeseen delays and I don't have a final Acked-by on
the device tree bindings yet. I do expect that we'll finalize this in
the next few days, though. If we do, would it be acceptable if I sent
an update to two of these PRs (dt-bindings and arm64/dt) to enable this
critical piece of functionality?

Thanks,
Thierry
