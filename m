Return-Path: <SRS0=qcKZ=P5=gmail.com=thierry.reding@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB529CA0FFB
	for <soc@archiver.kernel.org>; Fri, 30 Aug 2024 14:11:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 96D49C4CECC; Fri, 30 Aug 2024 14:11:52 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 91A7CC4CED0;
	Fri, 30 Aug 2024 14:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 91A7CC4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-371ba7e46easo1281130f8f.0;
        Fri, 30 Aug 2024 07:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725027007; x=1725631807; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RtpP67cv70Y+Louq0UOChaWqSWUFmRCVAXzaACPA2pY=;
        b=KW7d4pIN6dsxRbIc2khsemQLDF5tkdUKRRLbd9lzJ9TDDnladyUef4XarmWMTk0JVP
         O3c4v4uSifp1fcQF7SlFMaxpXy3FyVhsvgLDiOiHTgWZZsVHW9sPfvsv4KJ92IsRFZU9
         tKP3y14bdXz+Fz5kUWtUAXJvWf+D3TyV483ooRnaD+BlnsbXHJda4Os6wnSVd282RxI+
         IjsaDLtWaU5nu9/PdJ6+73dPfqfoh8lXtuG+H9S7h7jVdQrr6R7UHc9v8e02PPhoA1gp
         s9Dl+3+PIFKA05jH61oqgMKIKIMLl37ON6w3d7MzOWVcDOt8CTKsPmAQVdAKYKgwP+zw
         c9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725027007; x=1725631807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RtpP67cv70Y+Louq0UOChaWqSWUFmRCVAXzaACPA2pY=;
        b=AZ9ftYcd+4FbAqqrCiTQf18KsAYmhoteiAq/xKOEWYrjv11FYYymJYU3W2JMzzvBf/
         phuFqU6CWl7zFbelDHhAyv43Fk0HLT0qfXMCHilG98/ABvFiN8ua1aaFWte1cWB3qSfG
         wqylCdH+oxrCUSQ8TkRvNCFQVkgiJDaILOtKj7/iAgkREbOdvzHuA+8f/UUIL9XXQwSs
         pGA9chU/n5OSuidd2X7B1ba7i9pa0Uy05A1zi56UIJAdH56m7G6iBTJq+hoiPM5eZYjh
         ReOVYryu5UimqkgXqBEVLLLHLS/lG1ny47chEyyz1OjmDtagSrkYhGR6kygNKcmIkr1L
         9IFw==
X-Forwarded-Encrypted: i=1; AJvYcCXPcShdm8udONtttvj++HqdYL/36zKBBFyMn7wTgpUax09gW7xwvwuVEuK1mPrymu8psrc=@kernel.org
X-Gm-Message-State: AOJu0YzFncW9PrAw+UBf2NLUamJjd0aKDUzH6ouC2NzM/oVDhs4oBHEX
	sHDV5Z+vXhfNu7Qga4r9HWp8IQVAfKa2vkqhof3TA2BXLxEPGGpy49p9wSNw
X-Google-Smtp-Source: AGHT+IGw2yUzapuvRvvhKYsaUVgWMUVUqjU/inDZhwy9DTWkKdQqFGaIZ9mVoZA60vfBKxyefLPqrA==
X-Received: by 2002:a5d:590a:0:b0:367:8383:6305 with SMTP id ffacd0b85a97d-3749b587a49mr4178706f8f.55.1725027006588;
        Fri, 30 Aug 2024 07:10:06 -0700 (PDT)
Received: from localhost (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bb6deb1ebsm47580525e9.3.2024.08.30.07.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 07:10:06 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] firmware: tegra: Changes for v6.12-rc1
Date: Fri, 30 Aug 2024 16:09:59 +0200
Message-ID: <20240830141004.3195210-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240830141004.3195210-1-thierry.reding@gmail.com>
References: <20240830141004.3195210-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 8400291e289ee6b2bf9779ff1c83a291501f017b:

  Linux 6.11-rc1 (2024-07-28 14:19:55 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.12-firmware

for you to fetch changes up to 8812b8689ee652ee7f7e958473a9de56d7c184b6:

  firmware: tegra: bpmp: Use scoped device node handling to simplify error paths (2024-08-27 15:58:38 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.12-rc1

The changes in this set remove some unused code and simplify error paths
using scoped helpers.

----------------------------------------------------------------
Krzysztof Kozlowski (2):
      firmware: tegra: bpmp: Drop unused mbox_client_to_bpmp()
      firmware: tegra: bpmp: Use scoped device node handling to simplify error paths

 drivers/firmware/tegra/bpmp.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)
