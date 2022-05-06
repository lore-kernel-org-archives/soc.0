Return-Path: <SRS0=HH3A=VO=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CD8C433EF
	for <soc@archiver.kernel.org>; Fri,  6 May 2022 14:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6E91DC385AC; Fri,  6 May 2022 14:30:15 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A5DE4C385A9;
	Fri,  6 May 2022 14:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A5DE4C385A9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id n126-20020a1c2784000000b0038e8af3e788so4482864wmn.1;
        Fri, 06 May 2022 07:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XvzszIaoDVyGIeiyDwUueQbTfRTKog+5eHM5w7GT3Uw=;
        b=KYximoHLvW2jnoDv6V1VvejmoARYe+s05gRb2gHDKNyymp5wvO8XECxRmNIg8UPTwB
         /tTuMIXU2OdiwBalcZZJBv2auLDke+PyuIUaIpQplG6BE2HUxuZ9KQPiJ5qOuz2XfPkA
         P8nQ8jZ6phdo1/AN1e1GzXC2lKLle27Wvc5ykVTZ+r/JlwbezthlU1z8zkwqhHWdJ1tH
         x1ZaPq7O1B/RAvDBSRdJfUAN7yp6scug7KGFYGj7i2FDUiDqrQsTghmGx4oIvC+x3nck
         WLGpsYGy71la7mDqgIwTJ/fufWwa3aMtL+A7OVR2zwD2ZNagVOFYfmr9yva8W4FvmdzX
         fGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XvzszIaoDVyGIeiyDwUueQbTfRTKog+5eHM5w7GT3Uw=;
        b=57LksBL7FlzrcIEl1SZ7LYEqfJJnS7SjRZRaigjpWBBnsrj85cAglO+ssJ17x8SdQo
         eQWCJvvPfStrSkO/6/N5mohJEWvsY68OlAMuVNo61mybND0C+FexE5YdDxV2aSK17QMk
         FV7n6N6mRDdnDHCAGRlnnvamEDqKE/Yc2EQoN9BOAI+HM5x7GLvG6Iyzfcy0KSkUsLu3
         60JK+5JCZs2ORQEekROoqECN66oT8hyLZXlYPRcjlDOVxdddrdAudWiB/AbQlRJzldYI
         u2p6UFNuSZ31nbPgXaV3YmhdOb5/H5MEGZP0B+m2Yx/ClxXJ+SyPlJKwMszmXI64w9NK
         zSuw==
X-Gm-Message-State: AOAM5308tGvEbE78QLPqXjsm+Q8EhLg5h3l0cxYwgsu4Y0hOEFhUxAPs
	qE6zL8qY3eQTqx50Nn/gxRDV6c5Ddi4=
X-Google-Smtp-Source: ABdhPJwUKR3iNuQKRW1bDmDSsMKBsXpPJcrUwzKrZaVbllOBB3u0Yvtka4c+NPZLtMhCR1Fj7IbwFw==
X-Received: by 2002:a1c:2185:0:b0:38f:f4ed:f964 with SMTP id h127-20020a1c2185000000b0038ff4edf964mr3613394wmh.115.1651847412336;
        Fri, 06 May 2022 07:30:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g6-20020a056000118600b0020c5253d8d6sm3825361wrx.34.2022.05.06.07.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] dt-bindings: Changes for v5.19-rc1
Date: Fri,  6 May 2022 16:30:02 +0200
Message-Id: <20220506143005.3916655-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-dt-bindings

for you to fetch changes up to e2ab93e59bc3c029b61a7091825f193f1a66a1a1:

  dt-bindings: memory: tegra: Update validation for reg and reg-names (2022-04-29 10:32:09 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.19-rc1

Updates the memory controller bindings to properly validate the number
of entries in the reg and reg-names properties.

----------------------------------------------------------------
Ashish Mhetre (1):
      dt-bindings: memory: tegra: Update validation for reg and reg-names

 .../memory-controllers/nvidia,tegra186-mc.yaml     | 80 ++++++++++++++++++++--
 1 file changed, 74 insertions(+), 6 deletions(-)
