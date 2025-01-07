Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117E81E5707
	for <soc@lists.linux.dev>; Tue,  7 Jan 2025 23:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292408; cv=none; b=WlbmHhktStgr/RiTGEgpekISG6s8DVxiUNQ/JyM6CYeO80WWD9zW1XbrfOv8pRUOpwnoHR+J0H/1X4itUKDuQ4CiwabQy4QgjkHK/4qN8D7tKfxj2nrCFJZQYA18C9bYd/acrm3NfZHkWSA/tv+h88knyQj4LZV+yIuHgFAE0PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292408; c=relaxed/simple;
	bh=70NJicN4lkWN0R/+p/7ByCJUNzbiu8Ks9I2Mhg8PY4U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XYpHGVtTzXn8PZu+rk4mat4vI5KTOGWBoQ1rRt1iJpGtOACXkYT0MTJ1RLfU+1R+FBvbP3VmNzeAS6ApKe2Cd7XYyjawCH7olAULqlO1pYN2a6X5/uIjQC43xm3+3b3TY85Jw744Bz1G0Hm5HjU8Qs7ntaQgsKWcIKSQ3Edvo9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=CGBX84UH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CGBX84UH"
Received: by smtp.kernel.org (Postfix)
	id 057B8C4CEE0; Tue,  7 Jan 2025 23:26:48 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 95D4CC4CEDF
	for <soc@kernel.org>; Tue,  7 Jan 2025 23:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 95D4CC4CEDF
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so23664775a91.2
        for <soc@kernel.org>; Tue, 07 Jan 2025 15:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736292406; x=1736897206; darn=kernel.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2QDdyedWsqG+v2AZi3H9QCS2GE53jTZNmzxpEDi/sDw=;
        b=CGBX84UHewJFb7GA690gauZu/LGc6QR0duwy4OA2hzV/H1Xqoej0CEm7+EFXYpqQMf
         /unRYGdSdvBavLe9jdPtoRHqvzP3vVHMCOjinU/P2QMzV9aJiSDKGeRrNnoE253+gB4a
         jVPVlpynQa9vXqP/lUuLZDLOR+X1EXSgtlDeC+CHTqPpIlBtnDFz5vKSY4RMXtggjIBk
         szsIdeTWyu1DCjuRmJiQkOr6XWyOtli2zloPReV3+b7HWOOsTsShNV6Opc0Q1UVynaTF
         7CmeTgJI1ciu7yFWugpRVW5/4mrK57cYrR7t2Bf2D9Vtq2cxKfZW5MZNKH3+KbmUkgd9
         I2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736292406; x=1736897206;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2QDdyedWsqG+v2AZi3H9QCS2GE53jTZNmzxpEDi/sDw=;
        b=GoSkISaomaZtxgizPbzELiUM0Sblbbjcamm++fggekSzmDWvy3rrFQDHv0ymWL+Otu
         uvYHkLL5CkXgZUHtg4u4vOb8IKHTw03giIQlVSHk1eN3MP1QlBjrsMnSpVA+XvMQzSFO
         kSZMZUE9tnrEjkjPnYL9mDQtRuX82kNyD9t7emSO5N/jk7Ap9eXlZ+sZg0CXxFXjvdXW
         p9nIHI6i97HZejmULuJyWNoUU/vhsEEK8NK7TM9vCuT4xZJiil+l08xLLlN6SZDXXf+R
         hWPb7CXsEEojoKOEAI8b0vAH0LoaSAR8OIEWBuj07+bzoXwWTxK09kkZu1bwGYDEGNYc
         bODg==
X-Gm-Message-State: AOJu0YxJL05K55ZuZ1uFXD22xen6m42Uv/jjkMne9kUKaK2/TGA8QXpF
	8u9RV8YtEHUXFsTECXMvpGJN00XF3r6tYHoGUgJ3ISoeCHnRd+yEep2TSPKcsf66kVLpPFpP+zm
	B
X-Gm-Gg: ASbGncshdxaA+lAoEXaKM8u0+Cuy13RnD4hLgedIgrkyHoT1ZaM96SGwtppHhZDK66B
	FwPZ7cGiCV8JNRPpB2tAgjOoxSjIhawBsxlpPtWXiZ3bIY/Am7spWnC/9+LeQjyqTrufYJI/KMl
	P2XtTGcEsUAQk/2UXj1FXDVeeq+xrIF/Em4ezBUbX5BSjKMEn6j6yCODewdm8ZvTsUmGkRhES9F
	5rG9eQQ+ZtH9Z1gOJXaxiB1RGd7fF1M+Nr7CbIIExwz/+JeyO4QhaM=
X-Google-Smtp-Source: AGHT+IEkqXBuXNblGZ518IQhUFeptLk1bmMCSYZHXrxvLRxYePl8DdoRBjuLuVKBAlEE9rwoMDaFyg==
X-Received: by 2002:a17:90b:2d44:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-2f548eceda2mr957257a91.21.1736292405710;
        Tue, 07 Jan 2025 15:26:45 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a26acc3sm87438a91.4.2025.01.07.15.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 15:26:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm/omap: drivers: updates for v6.14
Date: Tue, 07 Jan 2025 15:26:45 -0800
Message-ID: <7hcygyb3yi.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/drivers-signed

for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:

  Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)

----------------------------------------------------------------
arm/omap: drivers: updates for v6.14

----------------------------------------------------------------
Andreas Kemnade (1):
      Input: tsc2007 - accept standard properties

 drivers/input/touchscreen/tsc2007.h      | 2 ++
 drivers/input/touchscreen/tsc2007_core.c | 5 ++---
 2 files changed, 4 insertions(+), 3 deletions(-)
