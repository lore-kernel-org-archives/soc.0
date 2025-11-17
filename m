Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32B52C08B6
	for <soc@lists.linux.dev>; Mon, 17 Nov 2025 17:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763400524; cv=none; b=L7k6OJcCifOuDWD4lg6EOETEMZPQRnD73rYBFlJBFeG+RecJu2W8lwduw5t8gh0L0t5GOxIn4JifZ7lCEqrjep6Eg7Lw5L/E8Xfz0VdzFR3MhUT9Rom1KNk39zrUqrWXjs8HZBlyebIxC8Ce8AZoDU+6SrpIZx3gvmXZ1kVMOtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763400524; c=relaxed/simple;
	bh=kDPsXivH00xRQlXERSN4T6T1lscUspSNZe53c/pLOQE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=GTj+4a2BvQoWX+H6a4crCXZ3hepZBzbEBisB0OC9J0GSF4ggz+4HEHHP/qRka4C2lRI34RQBySF1UiVSaRshi2PG1cLptMWDYYB6J89lp70vTiPBtTRByXDYVIJGo20nBn/r8ZNIHr7KckFVpIVKKtndnEdiMxzscP3iQijTGBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=E+gniwu8; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="E+gniwu8"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3437af8444cso4728686a91.2
        for <soc@lists.linux.dev>; Mon, 17 Nov 2025 09:28:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1763400522; x=1764005322; darn=lists.linux.dev;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y7wt65Eh0qxK+FXODcyVSRUfC2/FGp7c38rfv83jttw=;
        b=E+gniwu8y8QSB92ZMIw8sc02wVBgSPOhrECpqsCIfrQ5Hif3zcQYi61pSFqad7xMmV
         5NoGNDRU1q9tRUahrF/9o10GbvFEqx0r6cPIfSrKDJFPiVvoiCNizW+GukC/Wf9fsEqU
         vZw7HcmrzVY+My1r9crHyD/NXMzqpigaKEIjeBLoPIXm19vnVIyNtsf8TbfG/HDmCUUD
         DaXDAVAnr/W7J41Ygk3uBzkHJzTYp7RMKYRbhnFAtmo2NXZyejq3CPs3uYhFpNF6CHFx
         4cJ9SQklSRWulOlIWzMsO6dr/sDmIaQPuBSKTLzK2JzqSiXLvAeA2/DLLjA/wfctk9jf
         ozmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400522; x=1764005322;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7wt65Eh0qxK+FXODcyVSRUfC2/FGp7c38rfv83jttw=;
        b=Y7bLHxDMil3OYAtFHsV1l6ft28Qohj10SPQxKiaccAL4kcxBS3mxHr/Y231CIC5qXm
         X7HFVTuwkFdrbnzIQR+bzsvMezrf2yxuxY18JtIExnLUnhKHSxBc4B6LR+mTi1pWER0y
         saDf5rBPjkqyFgXJLMdQ46bjc7WkPBfuY0dwWgm3CUvj44nCkNnkybpHXuFzNEvbAAxI
         LS0cqBJmAmaCzHY1agbO7kDoLLhDpt3FRw+k9/0S4CgHyG4BdCixc7laTw2DyhER0p96
         9xog8GHZ7Y33XO0XQaYOUpl4MTMH5uNkQd4Xy0wENEE1HGv+WFAlMbsGfFrLSIFjKnYJ
         Fyxw==
X-Gm-Message-State: AOJu0YzsRbUaWuQ62j9/UtZXQMBDU/NgPkDZ8hhmclmRGJ0oSixzx5lN
	pKvEx0e67WpWaUrc9ITrlUII176oZgHaijjibHyByQ57iQArGi8DyTafzUZuZDvbBm5qZzQRXl8
	lREohTzg=
X-Gm-Gg: ASbGncs42r479vY+cTY3A1bG1xz2Q1qfyNWYyjpNA5s2I/QGPzhcEjBSjs7wink42ak
	NeYZiI+2K/MObU1fdOm39wxxRSkPQRWaZDrUBwMAJHkZ41vAVfHw6yuLxMqjYBAaBLoeyqdFho2
	DSHiYWEZ+cp2Zi/vPIDIFj3BD4RpJCrkOjW2DCAVNLykt4JNKHFRs9/NOir4GSy1KAlZNuV4BaF
	DgJmUz/nar3cCvhcIxp0LFEAXbexRsVDjcfgpQS56kTco38FFS8cSM9A0l6tKsEbj9NMuvNx6Vg
	lhYrtlIJ/6mRcOgg0Re2gNALiHgjU97Ajp0JkjR3QhSuHt30VHNEWPqf4HW1eB7+X4A/KQK4eOd
	Hk8l7unHfb2n5bXQ5wJ9fn75khvAmJPxevEpQk+4TIKQ+ytp3U+2U+xyRa0fzVsSvxKdNroPm8g
	==
X-Google-Smtp-Source: AGHT+IHYbjHg19oozELCuH1Sepl41Hl6vXq0kA2LdsYPKUkCrFNp41EV5hBuCCfJikNQi6qXu7K8CQ==
X-Received: by 2002:a17:90b:1d0e:b0:340:f05a:3ecb with SMTP id 98e67ed59e1d1-343fa74fccdmr13709653a91.28.1763400521875;
        Mon, 17 Nov 2025 09:28:41 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e0794ed1sm18965400a91.12.2025.11.17.09.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:28:41 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] soc/drivers: OMAP updates for v6.19
Date: Mon, 17 Nov 2025 09:28:40 -0800
Message-ID: <7hzf8kk1pz.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.19/drivers-signed

for you to fetch changes up to 3f61783920504b2cf99330b372d82914bb004d8e:

  ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx (2025-11-04 14:48:47 -0800)

----------------------------------------------------------------
ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx

----------------------------------------------------------------
Matthias Schiffer (1):
      ti-sysc: allow OMAP2 and OMAP4 timers to be reserved on AM33xx

 drivers/bus/ti-sysc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)
