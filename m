Return-Path: <SRS0=6LjJ=I6=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A977C433ED
	for <soc@archiver.kernel.org>; Thu,  1 Apr 2021 17:26:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id 26BA661373; Thu,  1 Apr 2021 17:26:01 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A673C61393;
	Thu,  1 Apr 2021 17:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A673C61393
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=thierry.reding@gmail.com
Received: by mail-ed1-f43.google.com with SMTP id bf3so2815058edb.6;
        Thu, 01 Apr 2021 10:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GMblnBVnulvH6aIz/MT4g7SaDY1kdi5Yx0m1X2b/Wlo=;
        b=fuyL0AYiFQMbYBbNkrX575nXxWE6ZHj11DzMJQBH1+mP9DtWhaygZLhBkV9LoFQYtm
         v/LidO0rpF6xO4zfEPbImcjWuftBSNbQ00SH3IG1FYq6YEmW+zvQ4DNId6zsJUBcouBa
         6Ejrtq33xQpGdjGYwDjuNm7P2btNs552vHU+rnUzGEQIuQ+WM3VJkxEDKvQ2p5E+b+he
         bT2S37DOn8zPIE5hFB7FapdhrXM+QeEeXnBMs9UcREGhbp/kFQFaQhYnEyOi7suZ9Tfg
         oloCyMXRhsY+u2PmZQLD9JEzf6Q0a5JBR3J+Ulb9aqsmQgblZ16/1K3+ULsbW8ruaepW
         3J5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GMblnBVnulvH6aIz/MT4g7SaDY1kdi5Yx0m1X2b/Wlo=;
        b=L+aoV4oXhhzr1Y+nwHnuUFdlVfaM61RZOwL6jCPP2aW+s9Pof1aPlbQH+SWxVS2IJz
         c6kgW9sdM+hswbT9IjeN49LWQkmuwud3dAQq5aNAAm9ajOrwPBVXiVWhRY9nYhnCBtyg
         oENFJcqxxlp0qDdEhBS0GUe8Q+xuX8BFBw9MIDKvAInnxI+6XdRO+c9n3iysbFSqhQtP
         6mCJ6MagoCMn23aCBHRoNux3V9gdz5i/OWljVIdUpDw8wotDSxsQytsgC3IXLjCEB2w0
         GRstdBZXDGIFlK43cBOJyOS1NwBFU4akiowqiur4sriBo+NiBk4qXCAKlvfC+cVGPHKr
         WHnA==
X-Gm-Message-State: AOAM530Aecily7C295XX/a+B50EMVXRG4jTkmToJNpj8S2oioJQk2zy3
	WN2XkUfBusLLp5bC3I+SNxgSsnxXABg=
X-Google-Smtp-Source: ABdhPJxl28lLSjZdqRGFy24R1fPXWHpNZxrCKIsIji0q5YfE/004Mvv3PNwnpZSrACN6y3NUIxYsuQ==
X-Received: by 2002:aa7:de11:: with SMTP id h17mr10860271edv.83.1617297958938;
        Thu, 01 Apr 2021 10:25:58 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g20sm3745557edb.7.2021.04.01.10.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 10:25:57 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] dt-bindings: Changes for v5.13-rc1
Date: Thu,  1 Apr 2021 19:26:18 +0200
Message-Id: <20210401172622.3352990-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.13-dt-bindings

for you to fetch changes up to d1e24c46250731204dbf61b5191e4dcf2c2d9391:

  dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop (2021-03-24 14:04:40 +0100)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.13-rc1

One single changes that adds the nvidia,pmc property to the XUSB pad
controller binding, which will subsequently be used to implement USB
sleepwalk functionality.

----------------------------------------------------------------
JC Kuo (1):
      dt-bindings: phy: tegra-xusb: Add nvidia,pmc prop

 Documentation/devicetree/bindings/phy/nvidia,tegra124-xusb-padctl.txt | 1 +
 1 file changed, 1 insertion(+)
