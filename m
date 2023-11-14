Return-Path: <SRS0=Illy=G3=linaro.org=jens.wiklander@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F72C4332F
	for <soc@archiver.kernel.org>; Tue, 14 Nov 2023 15:31:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id CD763C433C9; Tue, 14 Nov 2023 15:31:22 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E28C0C433C7
	for <soc@kernel.org>; Tue, 14 Nov 2023 15:31:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E28C0C433C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6b20a48522fso4814282b3a.1
        for <soc@kernel.org>; Tue, 14 Nov 2023 07:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699975881; x=1700580681; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yo+N2TjxrLqUZ92GWyrWSwHOBXAjgY14sEHZXRwIRDY=;
        b=M1yEtaQiB9DhkZ/PnC+XJVoLEZ98ovmQsY/g1iDXCNwMJAnFOsc9JhWB7N4EwAqAtK
         cWxGXR40/GXFCN91g2YNk7AnZbAzVAV449sd9imQzVVCKoWBV6PHl/S6aHyl4fzmWzrf
         bSY76wcsgWnns/WzJ5Esm/0ApDTlopJZ65vlqv5Yo1w9P0hDs0Gl6y+QcPVVWBlpYsib
         E7PXaGNzkYW4oXhxD/moAgwqJQBV78ekKq7ZYTiqpdVZG7CiZZhJ/Ufi/7O/S79BMsqt
         SFSSqx92DVVlnrOTOEfZNY6fXXq+Y+l7AhsVuWnLaCFqLCbuNqcMaRtTUza2yS1wW+HP
         wvNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699975881; x=1700580681;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yo+N2TjxrLqUZ92GWyrWSwHOBXAjgY14sEHZXRwIRDY=;
        b=KG8i1NMJOEzD8WHYqidy37unIdy7Awp2Pv1/ENxmQgyYe8LZ8+6jwmFgCT5pMgv8YQ
         XSJeK6hHu8FSqlmsgWemYiHqheCqFEfAXYCTYZL2bXuMDpMGbGDuzwPHnHDtJDhc9BAC
         zwSJYBz+jaEb97Ais/I9uCkcFNlOIixcKRIFrRDx7l6aV1GCfNW8hQh2Laz+TiOqIhAi
         PtMzRYJq8UBt3Jzl7nLL/NnAh2BC7F/cGQT/VLNQcIFSYdyciP3KU+7TJwDxYUKFhwn4
         Da69nRVYFjXS7IcjC0rG+4A5wVfGFnwQC/sIFHS8IDLltBjACT3g4gsQ3/hMkuvPREUh
         zAMg==
X-Gm-Message-State: AOJu0YyrqUDpDID2sEm+Qs9gp98X4W9Lo5QbT1Y5fXQZbH1RJa6PZBas
	FALLpI48HzbI7gwCSWt3+IeAzRhRsxPZQGbIN1w=
X-Google-Smtp-Source: AGHT+IG2AJsWaZeUJC5OapKyqMNLMErDKtSX62TfDgTaaP18bvLy32SGjZ5zH3KyJY0U9ZaspeR1gw==
X-Received: by 2002:a05:6a20:12d4:b0:180:e3f1:4f60 with SMTP id v20-20020a056a2012d400b00180e3f14f60mr7497801pzg.45.1699975881244;
        Tue, 14 Nov 2023 07:31:21 -0800 (PST)
Received: from rayden (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id fn13-20020a056a002fcd00b006c3328c9911sm1339118pfb.93.2023.11.14.07.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 07:31:20 -0800 (PST)
Date: Tue, 14 Nov 2023 16:31:13 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fix for 6.7
Message-ID: <20231114153113.GA1310615@rayden>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this OP-TEE driver fix allowing supplicant dependent devices to
be detached by user-space before the supplicant service is shut down.

Thanks,
Jens

The following changes since commit ffc253263a1375a65fa6c9f62a893e9767fbebfa:

  Linux 6.6 (2023-10-29 16:31:08 -1000)

are available in the Git repository at:

  git://git.linaro.org:/people/jens.wiklander/linux-tee.git tags/optee-supplicant-fix-for-v6.7

for you to fetch changes up to 7269cba53d906cf257c139d3b3a53ad272176bca:

  tee: optee: Fix supplicant based device enumeration (2023-11-03 09:27:20 +0100)

----------------------------------------------------------------
OP-TEE fix for supplicant based device enumeration

Adds a sysfs attribute for devices depending on supplicant services so
that the user-space service can detect and detach those devices before
closing the supplicant

----------------------------------------------------------------
Sumit Garg (1):
      tee: optee: Fix supplicant based device enumeration

 Documentation/ABI/testing/sysfs-bus-optee-devices |  9 +++++++++
 drivers/tee/optee/device.c                        | 17 +++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)
