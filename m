Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87A4214236
	for <soc@lists.linux.dev>; Fri, 10 Jan 2025 18:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535254; cv=none; b=WG3jkVJuIWux1l6MRHLfAaGLriwZWhuXWgXjX6/m8urbqsNNPPJl7vOrBB5ydX7YdjzpRN9WLiU0Xgk0pOPtEgVWre4IoQTJZZOiLA68/tE0vuw6gYTiEmWDUAr6ic+Ru1WHUD5W8ynIES2vwvUbavlPgObRMzMzJsZS8oa35/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535254; c=relaxed/simple;
	bh=DndyNylIL+ZUCxEtjNb9q4yI0eEiTKy2w9nASbTZbxU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gJIx589mzpH8ToslD4oLQBqnBw7aSipxJhZ6MivIlNodSoVY+wfGo0jUF/joUZhPbB+4X2lEiM8NohLFattKEKuUft2vPBTpwm/NPUuEEi0ICdpYsRqt0BBkiU93bbNnOaWQOmwO9S+pYhNMlEukjnk9tTeJaP8ggAUxAGnyQOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aux6GaeK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aux6GaeK"
Received: by smtp.kernel.org (Postfix)
	id 8A339C4CEDD; Fri, 10 Jan 2025 18:54:14 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id ABD29C4CEE4;
	Fri, 10 Jan 2025 18:54:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org ABD29C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43622267b2eso25914395e9.0;
        Fri, 10 Jan 2025 10:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535251; x=1737140051; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSzrQeseUUwDfAM8Q0k65Q1Koz1ieX1zSngb4j0vsQc=;
        b=Aux6GaeKAkhZxaeipymIdnNDVCJ7Qytp6Y3fxETpeXOj9QT6QFJTxqOtJYp2LkhQNN
         gsn4/FRveNLey8c0B+5zFPnBAu1qblux8RaTHX42PoCJgZIKNvwzdwpTo0dbV44qBSTD
         qutm+y3x1dyednGSAjCowADi/AZtGphQ30MRevWaBXHEeWVrtl49acoOzbLYUiATcf5f
         VpkWfUI0sJv0K18zLPFBccTbRQ/RSV2hb4Urz7RPqQUauUnUfycAW8hF2g7tNK00DX8g
         2bg0j7BAf/vuzNmJYljEKbziRc00NbYGdQnb/Fm2tRvsaurJh7zFO2ohPxgP6LbFc0C9
         9eUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535251; x=1737140051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CSzrQeseUUwDfAM8Q0k65Q1Koz1ieX1zSngb4j0vsQc=;
        b=Q8B21GnaoEJq8Ox69ukMjHBBeSWZ6eWQhMZdnwh3otR+ZMXckFqEE8fxVGXchtvQF+
         gLOtFSlNpNknSRfnwjmp4Y0d9eDTFccW7U59Ztl/wTVCuVRtb6nm8D61gaHS1myS7UMk
         fogxhpwQI80Ww6VRHDOiGHHhxfhUdJOUmNfdyE3MRJ2dq3wi9XGHU1KvuFzOppivq1ow
         J9CWRJ4l/MicxPFC+Xbcz9vIsSRq3hjiDHVrt759BWuWGHPnLVtQmo8YUfzNoNT6D4wE
         P0/Wvu+rR7zEfuqlfgffDUD0fpaGcIZL4dOg2U7uf5obGDIqbwvg2jz8EtpzEMQFc2Qa
         ixCw==
X-Forwarded-Encrypted: i=1; AJvYcCVd9PlnsmxyhGcare4PDbQAYv594SyLG/zw08D4KSVmVFhHg45ICdDPp9i0ccsgC0pFfT8=@kernel.org
X-Gm-Message-State: AOJu0YzAOTIqal2/oA9NrNRGldyfbjTGXiEV1P/jc1VuyS9YyvausmRo
	dP3VJ2tdRQOBrsWperP95wx5KRGMIhSa5mCpdAgiFklGImAXHoWxNnabyA==
X-Gm-Gg: ASbGncvUxeuOCDteMGt4Ss8W8KlezHw3rDKW01OTchL1tbOsskBXmTehJ0ue1Wfd91+
	Jik/rxxYSpZXNd7YuNzk37sqWxojUVedUFs8nSayA+P5cc2LmjpAZrvsn6lwVBRwIvs0Ig8cvn7
	NbGSjl76cI95nTSc7yRa9W1BHtVMEGi60kOrnA0geUflfdFaEt6dirGFo8ss13LeRQPbo4N+djF
	9L8EJxjSIiSlO0AREMWQ+mv/o6GcuJCa7IZNre/7wjPk2TGQAFXEqXaJQOULKlNiBrt7azhzghc
	mU+cJv+vaOE6Pan21di81GTl2i4gj2NaD7L0s5JIyrUWWWI3
X-Google-Smtp-Source: AGHT+IGL1UNuIWvfIXF5q1ZuB2NL1WSHb5lPRNZ4RnJeqXAHuM/DlevEFHezs0QM4/P/ttrkrToSEA==
X-Received: by 2002:adf:a295:0:b0:38a:873f:e31f with SMTP id ffacd0b85a97d-38a873fe683mr8253747f8f.1.1736535251283;
        Fri, 10 Jan 2025 10:54:11 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc895esm59818695e9.13.2025.01.10.10.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:54:10 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/3] arm64: tegra: Device tree fixes for v6.14-rc1
Date: Fri, 10 Jan 2025 19:53:53 +0100
Message-ID: <20250110185355.4143505-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110185355.4143505-1-thierry.reding@gmail.com>
References: <20250110185355.4143505-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.14-arm64-dt

for you to fetch changes up to b615fbd70fce8582d92b3bdbbf3c9b80cadcfb55:

  arm64: tegra: Fix Tegra234 PCIe interrupt-map (2025-01-10 18:47:01 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v6.14-rc1

These patches fix up an issue with the DMA support on one of the SPI
controllers, as well as properly identify the SCE fabric and disable
it to prevent accessing registers that may not be accessible to the
CPU. Finally, the GIC's #address-cells property is set to 0 to fix a
problem in the PCIe interrupt-map property.

----------------------------------------------------------------
Akhil R (1):
      arm64: tegra: Fix DMA ID for SPI2

Brad Griffis (1):
      arm64: tegra: Fix Tegra234 PCIe interrupt-map

Sumit Gupta (2):
      arm64: tegra: Fix typo in Tegra234 dce-fabric compatible
      arm64: tegra: Disable Tegra234 sce-fabric node

 arch/arm64/boot/dts/nvidia/tegra234.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
