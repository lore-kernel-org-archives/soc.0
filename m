Return-Path: <SRS0=mcGr=F2=linaro.org=ulf.hansson@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C648CDB46E
	for <soc@archiver.kernel.org>; Thu, 12 Oct 2023 13:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 59A31C433C7; Thu, 12 Oct 2023 13:56:43 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 607A0C433C8
	for <soc@kernel.org>; Thu, 12 Oct 2023 13:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 607A0C433C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2bffd6c1460so11828821fa.3
        for <soc@kernel.org>; Thu, 12 Oct 2023 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697119000; x=1697723800; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0C0ORECBJTogxYQi5iDF0CcmtgNFNzkwmbMUlUi37Uw=;
        b=gZ5LKZmaDInRHDM8VNT0jEfEf6nSUNfFGG6ELIQI62Okb9sc2UoVX+N9rxl6GCyRKu
         YlfspJ50lJ8rkLAmz7tFi55Rlgmrc0lSyYWfbVVUkbudUhH3TtRglMMGqmQrWwIZYN74
         QYYpJ69gC0VMveX/qX3tEqKBPbpeInbkkyshqnvP+i/KriCmwam3vPMakYdbzaSAZ74e
         AtRNEPl7HwmrNvhTNjbVHmUdd/i+ajVWTIL/4sK4ZBuTARjbpNnelUDkUF04tvwfZi0N
         zEvU6FfiznBaaq3j7k19JONXm8Vxv0pub8uCBZJRvazsPttrdy34mxQLnrmhpTzZhkE4
         AJkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697119000; x=1697723800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0C0ORECBJTogxYQi5iDF0CcmtgNFNzkwmbMUlUi37Uw=;
        b=tfpwfvuezdMXgBdhHhb8cMn1sPel3iL3uKsuotVFdX0Z2b3vBWr3rAqfo2uO4/WBsw
         oxUUvxU1towJhptR7TqNzYc9tOq2+63nG9PPJI4oTBDvX6RMp4WHM83TTge0jV9WQBO7
         7N+2E+GKzHmqa5a8bB7fanmJApiXJ9ARQnnvpSEH1JSsnvjl2pPiA/zYU+TYSClfH+PK
         01+v8Q6cyrCt4T+YpFi+EZlp4uRhF3i0g8ndMFEldqLNw9i/1kebz9T8OsndmaExPSKo
         TZfJpkBJFWhNXAQLKzWj6IazuN+f+isKUPzHrCoIsxVoQLVljh45NCVyNYUuqyS9rZa8
         HYtg==
X-Gm-Message-State: AOJu0Yy8ras/t3OsmDQ1pIEK56zNXknSkjzXmQJ2DtwMP6QS2ZsMJi/F
	0jh3c5Y0eNhc3J3smm4BCPjbOQ==
X-Google-Smtp-Source: AGHT+IGx31uLy8rL+rFIHO2SmgNtBeARAJKHgBIoVQQzrHsiObna4oUIOfKdc+mZ7sjdKbMaRYMjpQ==
X-Received: by 2002:a2e:9009:0:b0:2bf:fde1:2586 with SMTP id h9-20020a2e9009000000b002bffde12586mr21577889ljg.1.1697119000375;
        Thu, 12 Oct 2023 06:56:40 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-94-254-63-18.NA.cust.bahnhof.se. [94.254.63.18])
        by smtp.gmail.com with ESMTPSA id l22-20020a2e8356000000b002b70a64d4desm3572227ljh.46.2023.10.12.06.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 06:56:39 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Olof Johansson <olof@lixom.net>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	soc@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain fixes for v6.6-rc6
Date: Thu, 12 Oct 2023 15:56:38 +0200
Message-Id: <20231012135638.52674-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Here's a PR with a pmdomain fix intended for v6.6-rc6. Details about the
highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit e2ad626f8f409899baf1bf192d0533a851128b19:

  pmdomain: Rename the genpd subsystem to pmdomain (2023-09-13 11:09:21 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.6-rc1-2

for you to fetch changes up to 767881c470b3140c33795031c4e4d65572731c1c:

  pmdomain: imx: scu-pd: correct DMA2 channel (2023-10-05 00:28:52 +0200)

----------------------------------------------------------------
pmdomain:
  - imx: scu-pd: Correct the DMA2 channel

----------------------------------------------------------------
Peng Fan (1):
      pmdomain: imx: scu-pd: correct DMA2 channel

 drivers/pmdomain/imx/scu-pd.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
