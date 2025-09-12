Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60272DC79E
	for <soc@lists.linux.dev>; Fri, 12 Sep 2025 09:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757668205; cv=none; b=I95N5Henc2F2+8eHZaDQhjJCt6YJj2/qKbGxw40RsigMMLck7TC69FmH5JZpLVmGzfdO3EasE45cCza5XTWx9d8Rge487IkFi+8bSLO459pnnXsfL4lR82c9/OoHijCKxODRFdkqTEn/u7f8BXpKg+H2gShP/Ud8qQOt2R6zV1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757668205; c=relaxed/simple;
	bh=8DqyAWrPHCSlw0Pa6kOyFtqUOYpuExdLnT0akgB7Nrk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WFuAsByxGfM0Tk4oqoN77haCMHZTTwUV9zkDQqPoO8AqQhAflPdn7NZZapqrZwz4QYNkvIVnshWkzTH6wydfJ/yITpcdgWOvheDbgpzzqpCLLqtG8zPSB/zsfJh/CMyZjJVStBO6oV6mUTM/YLORm7gS3+ZxgOsAZxSw9/gSCMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IBFJPL6O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IBFJPL6O"
Received: by smtp.kernel.org (Postfix)
	id B8066C4CEFA; Fri, 12 Sep 2025 09:10:05 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D10FAC4CEF9
	for <soc@kernel.org>; Fri, 12 Sep 2025 09:10:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D10FAC4CEF9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b0787fa12e2so238762166b.2
        for <soc@kernel.org>; Fri, 12 Sep 2025 02:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757668203; x=1758273003; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gdfBB7kobN4wJK8/RorJexdvYFnM7nbQB2ZHPDHvDh8=;
        b=IBFJPL6ONB9cnzzuneHhqTTbTBJ8+oKPLTykEAEgQhUCTBT/d59GSATxFXnFenzLqU
         u77Ue/GFowAKVeGoSUYw8XYZfI5J35oC9lUhOmGDkD53Q2m9vyJWC0mi1yELdaEC4Juz
         5uiT3XDyXxLFavEdSxtsiHf0FMZHbw41q/j2Em9GG/diby2qR/uMA+p1+TZG0XgQz/j3
         9R82qOyz0xIo2RVo+nEvHG2spavWSFShnTLygv8vVFFtkgMoZzzG4zTqYbGt1BagGFoD
         ty9MGjkbk+4igwBXOCNkuBHKwgjRAdUT5DTvIT6sJpw/Y5QZMJN4N2ygmU9vHp34eGDb
         b3Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757668203; x=1758273003;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gdfBB7kobN4wJK8/RorJexdvYFnM7nbQB2ZHPDHvDh8=;
        b=IZdEIRXq2MGmJ4wHjJTreAq+teAxOUtG1RpLFwe267G7rlCSYYBWnk4+qh/drZwuaw
         qBqhUebmF33ZSrwKj7tlKy5zcVp5ZLN+7hzGgShDbv2XPGSIv4gM8eUM1pBV2F/EgyeF
         Ews1pWkVuZeXLlG/bvCDM0lSc5YC8EN4J0PYTUUi/muNjMRVwPRYd/u6T2GLd6K5A1X+
         slrZw8R/L7pqooqaUsZ+h6Y6k5WNerhpsw8atL3UVYQ5qta1pficoOG6oHXC+RpvzD4B
         JU0VH+NIXsl69lSeQ0oUWY3FvmcZWpp7GZjeHsvpgoY3eDMgezmv7CsqdJr9jL2005yL
         2Oow==
X-Forwarded-Encrypted: i=1; AJvYcCXZ6sM7Hlfo2WStEPGDgFY06bROEQ9mgylx0SU7z2/9K+hvClZjOgZ4dqHRsV6mcYWtJUI=@kernel.org
X-Gm-Message-State: AOJu0Yzcj30r+vsU8prJFFBpWEgT7KydDahD8YltffejsR+Ecfg5M4sw
	7y6x/V6kjFTFSVohp00lhpgWT+TL4dX214BloOaShd58AKKAFfngzO8h/h4y7nuy2Dk=
X-Gm-Gg: ASbGncttvimRs7B9MdPipAMN2p6A40u/EHUHfwrQ+dvoFkLQvm9dacL9LPKGJ60EmGB
	cnYPkR67Psn0AiiIWqGTaNGAM0miSzmIEyXgwxgXEyaSzR7EvU7KTAGKAs8zJJ9wZ2HjzERKsTJ
	bPjh3d/fkPIb3j22IuVv1Mokg9vxqmYOGfqHfm2VJ+drRabFWRwYud9BCfAF6bgkgywt058Sc2y
	yWf2skcqJR3tMjTQT0IUWXtm2wlmQGkEJYrnMqy0m5dkn7aRWhjwoJR5I59J9R6LD2DXEkOjqkj
	oRYGKxq3YOcJwQAzb4QSnDX1DBDh66l90r13Wqp0h5ienNsQ66HE6Lk0Nl2aO0jrfJLrgpx6QYV
	aDUejm75EC9SOzwPZBX/HrCE0oFXncAa7T/MexnsyORFU/tZrVmuHkw0IMsdGGaJJ3A0wejp2PG
	Q=
X-Google-Smtp-Source: AGHT+IFuuHFceMoZ2ipUeSDV0l2sTDEKnIKxUvMqoFX9PBY3aeszRH7ix8zGbjWkfgqomp+Bhqsb2A==
X-Received: by 2002:a17:907:e885:b0:b07:c909:ceb0 with SMTP id a640c23a62f3a-b07c909d374mr116578966b.32.1757668203078;
        Fri, 12 Sep 2025 02:10:03 -0700 (PDT)
Received: from rayden (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07c6110c27sm125678266b.66.2025.09.12.02.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Sep 2025 02:10:02 -0700 (PDT)
Date: Fri, 12 Sep 2025 11:10:00 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE improve sysfs for 6.18
Message-ID: <20250912091000.GA1441709@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this small patch for the TEE sysbsystem. It updates to use
sysfs_emit() instead of scnprintf() for buffers passed to userspace.

Thanks,
Jens

The following changes since commit 038d61fd642278bab63ee8ef722c50d10ab01e8f:

  Linux 6.16 (2025-07-27 14:26:38 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-improve-sysfs-for-v6.18

for you to fetch changes up to 1faa0d62a19bb8a4b9022b603472e7127974cb55:

  drivers: tee: improve sysfs interface by using sysfs_emit() (2025-08-04 11:05:23 +0200)

----------------------------------------------------------------
Use sysfs_emit() for sysfs buffers to userspace

----------------------------------------------------------------
Akhilesh Patil (1):
      drivers: tee: improve sysfs interface by using sysfs_emit()

 drivers/tee/optee/core.c | 2 +-
 drivers/tee/tee_core.c   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
