Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082883CDBB4
	for <soc@lists.linux.dev>; Fri, 29 May 2026 11:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780053124; cv=pass; b=omafHDumCPQUiQG3PMcrsebsyHhxn048AIkn1/VaShR2ACHmmr6A4zvSGX6icGryDDU7u14sNcU3YV/HKn5FSGiNG0E3wuD8F8A1lfc7wHn4ciENntS8/o39owR4Xh3SC43ySydEVRbPcBbYDgik8+MxwxIXfk3ol+VtowDeKTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780053124; c=relaxed/simple;
	bh=Kakt6zhxRD0JeRVPS9sWBpYqDU1PaXLGgceuXRbNwLg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qb56PkN9ZftwncYDsUTHdrzt80ibsW5/70iDFCm/tnDO+ZoFE5F9THLCQYZanDq0b0MJ0oLt8txXscLDSjTdtKN4k8TdgBoSqTX3CDjoC4Lj8o36mrUcFQJKggEwiNIbDt5qQEbE/OHBMLbWRm9BWzXu12/qJDQZ/HHQAGsRBb4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jww+jAPM; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jww+jAPM"
Received: by smtp.kernel.org (Postfix)
	id AF70E1F00893; Fri, 29 May 2026 11:12:01 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1780053121;
	b=jJ1ZgSoJtvs02XKXOTg1K8wlpD6GIhlNtLnQy7vTH9gscWr8yLjsOABfna9TLmVCBqOd
	 7nK+TYWK6ME5yAghrlCbM/RyqZj+1HwOFuBtygsXswg9Ra0eeXfxiKxjQeI0GKQhNbRun
	 JMOPG4f+Cf5yUqaqmQlaAbvh9zs84UlbHGl/TX9bY+h/jSwAjCpqjmJCE/I4hIwXa/Q2U
	 sTMbUnn0CXgRO0oPH497cK0bQqCHrnZeyrLbkf7R4A3P13KNJvDG0cLoAsI8P8b5oztlw
	 7rNVyUhaR2H2h2LcyJ2HJCdBafseeJx5S+/6J3DT6bGWNssze9exxZpLPDa8uR6DfHQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1780053121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=tJZr4ds5xh06/P7V3+Chp2lk69csiorD96DTJ6REhXM=;
	b=YGXb67zERcdmgyTwQ2wu42V2hiXVwRiKveVjyijVqfrU2ZYKI5D8IKwi/PkCiXj0VeVm
	 ui4NHtua8pmEiCi8E3Sct5mgAjVw6my4tmYZtDkIKbFowLeJvsNiZjFNCQQ0/RcsegF4l
	 77SWZ0ZS2o/fB1muOO8wsY0FX/KFbS94lJFXlreTybrAzmu2jGt1gnvA7AiFrb4GXQ853
	 M+AlL2xLwooOkP8FnRCRNAZ0i7E4QcnrKKGPqWlXpKhsxj97PrKrdb9Xp64mwkQl7IuXz
	 5jaEl2nPK5gA5N7uXFHAe4ga64gpK6pZzPUebrhhWtIUnQobagakohGj1bp3Nrqs/SA==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jww+jAPM;
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2FE3C1F00899
	for <soc@kernel.org>; Fri, 29 May 2026 11:11:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Jww+jAPM
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 2FE3C1F00899
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a8f9841616so11349877e87.0
        for <soc@kernel.org>; Fri, 29 May 2026 04:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780053118; x=1780657918; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJZr4ds5xh06/P7V3+Chp2lk69csiorD96DTJ6REhXM=;
        b=Jww+jAPMaOGB5DHbm35TQPx3RdpvsMTjDwJnnrLMnDrQTBqZDtwbuIrcVx+mEL+Z0j
         bcsXnWDQOWwxZYW47MsaKS/r/Y8l19x3FkE854EmKK5npaj6cV7E6R9s7sff2tO5Xqps
         59DAGi4bAj9oEPR8Ht4M+sDbINmSd6At+EaH9YOFTDyGwvM8y7UWaK9cuuifrrpSJ4sV
         3iEJnaCr1NPNCBVY/qaOKDSGduoFdmkRXQj995be1x/vBCoeWeXy8lhuTKqDl9hEJehv
         SUODKVItfF1DvKgMhR08Kx1+bsmfcL+5JbSztKM1MicdqzxZ3NHmfC3lp62mwBuYR5th
         rHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780053118; x=1780657918;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJZr4ds5xh06/P7V3+Chp2lk69csiorD96DTJ6REhXM=;
        b=ZggOK6ZdJHdEq2GY71oiPR3J2E5WuBhzVmw2X9Swd3Sqg30Lbe6ZRjmpXgbGf4a9/U
         m66m89LoPv+Tq3dQcHOTS0g1+cnvQL7I6JmSvV0pOSiP5nlQCTAP9eABzcS1itgvuihD
         QuQ70IR0O3LBt5x3HTDvjliTKtT3vGtLE8BXiQMOlVEVWlmAzjg1YycYoixrddCHEMrp
         UppgSgT7BMTPlJTvZ1veW9u76mTWntHQM6aS4XnLwD8kBmOqNzwTpbOempNbQYTkzO5n
         LN30V/uXHhawDNWAOvoNxPQYWtwbUsjWdt0sy22S6XcWo9v6dafFL1o1g8mfeXUnIvWj
         CrpA==
X-Forwarded-Encrypted: i=1; AFNElJ8bKO8pMQK1p2ZwBa8LtK8nb3I0MCJIjMdLw2SUEu3VQ1AO3VQE3l14n1pq65wihrmd8hE=@kernel.org
X-Gm-Message-State: AOJu0YymSNAxDYfFqkv/tOpwxArHZ7x4YhDmJy8dnwUmPj86dmXVZLka
	XnkZA4wngvB2ESibV97d+QlYDhO9ahEYHLd9/W2NJLqDDvlveyaD25LCpuHi5OpLLJwb/BrQLiJ
	yPyX5
X-Gm-Gg: Acq92OE3Q12ivIn7d6qGZxhL6EA8vunSUt+orPwxr97AIHeY+OvbQN3mgvDjSr1TkQQ
	zXPFHX00J0ZvSxZJ4krB7jOzEICHoH9gT5n4bNdVxMPNWsxRykLLWKTtKaxxUTCAsiJ6P03k4sU
	Ijcz09M/gQb5i3zaHvIZEly+s/oO9aGDaWbX5i7DbdI1QO8yht+Oz2cSTz4sfMVe+kNxegrVJDd
	TTBTveX2uy1CkSo5wIVh0iRlFEtQcRdWKVr0nhfqb9FM0bfCQ8wf4b98kXvKUvoxRfgLA98zn8b
	kpAsAUXW/IA8wxwHxKe+6HAu0qXzl0sG9lFoMVG55icfr+UXifmYHQTbP3/G8uYr89N4wtn4p/f
	sPS+CXYVAXfolv965BRSej0KOGGO1I5gMiCVLfvstQaKO3hR8SXgIVdFDulI/cuMpF9igZ5syaM
	phcej2RyHr+duoaf5JHKhXAVXqBJKaPz1Mr1GHX9UDorHgUHrpGZbiZkR0kZkNas6xhe7wSRexA
	LAXkg1aj/dYYqvpEeDKnPDI2xZb/2M=
X-Received: by 2002:a05:6512:2304:b0:5a8:d14c:a14d with SMTP id 2adb3069b0e04-5aa5949a3c7mr732639e87.18.1780053118287;
        Fri, 29 May 2026 04:11:58 -0700 (PDT)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39660103a4csm357311fa.21.2026.05.29.04.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 04:11:56 -0700 (PDT)
Date: Fri, 29 May 2026 13:11:53 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] AMD-TEE for v7.2
Message-ID: <20260529111153.GA2532355@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello soc maintainers,

Please pull this cleanup patch for the AMD-TEE driver.

Thanks,
Jens

The following changes since commit 028ef9c96e96197026887c0f092424679298aae8:

  Linux 7.0 (2026-04-12 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/amdtee-for-v7.2

for you to fetch changes up to 84a1e6179bd24dc10e47f6fa2b36f0ed345e68d8:

  tee: amdtee: store buffer ID in tee_shm->sec_world_id (2026-04-27 14:13:08 +0200)

----------------------------------------------------------------
AMD-TEE update for 7.2

Store buffer ID in tee_shm->sec_world_id and remove internal tracking
structures to align with other TEE drivers

----------------------------------------------------------------
Rijo Thomas (1):
      tee: amdtee: store buffer ID in tee_shm->sec_world_id

 drivers/tee/amdtee/amdtee_private.h | 16 ------------
 drivers/tee/amdtee/call.c           |  2 +-
 drivers/tee/amdtee/core.c           | 52 +++----------------------------------
 3 files changed, 5 insertions(+), 65 deletions(-)
