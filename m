Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C52A153BE9
	for <soc@lists.linux.dev>; Sat, 17 Jan 2026 12:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768653014; cv=none; b=EExVXDYXQ1piVWM6sAc+SG4YbUtQcgsTLPWnuPtbs2mHDwqVVnFaRE+0IHja4nDOniQ2K9ymhQZ84uqvXN2uOUKj3VpHzTc2Y33jKXmDs/QF6dGS2e04b9qm2UlWZBHv7tpkBz29vGeYHr6dXF+Iqtkm4VXiiHzW/oTEtYhvJes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768653014; c=relaxed/simple;
	bh=oJpt2EumckLr6/Gf8OW2VuhhcPu/63sI8x26iYUlCK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KzRlkCkg46mO5hOQ6yEVOnw9rkJvoyLVBYuUOgcHIORvBwqQfr9Ixdz5YN1ZWGSwmtSZGckp192G+vriZZ0E/cCpbgMypeHUtUVblrk5yzwKD3+BT/hOMYS++NnhOZztosfQQHZmkPF6v49hHNAu9FkGgF0LLKr6+HzPC25hGYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vBVyR7g5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vBVyR7g5"
Received: by smtp.kernel.org (Postfix)
	id 2A9C9C19421; Sat, 17 Jan 2026 12:30:14 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com [209.85.208.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 23588C4CEF7
	for <soc@kernel.org>; Sat, 17 Jan 2026 12:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 23588C4CEF7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f65.google.com with SMTP id 4fb4d7f45d1cf-6505d141d02so4833806a12.3
        for <soc@kernel.org>; Sat, 17 Jan 2026 04:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768653011; x=1769257811; darn=kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4m/7Bfur2xzRjYnG86QrkUmg9v434JD51BbkdRFTRE=;
        b=vBVyR7g5eBuOQvSB3iOGOhMeJ+08Q9uztBe2CJPkLtzlKTzF1B8NPWLub7P4Trw02e
         YlKIt2P5JQyFzNRe/JvsZBL916OIX4okwxUSDyag5a/9K7EAFo3zun8ThMvvTjf+cNs3
         wjsAisX5uB+6NMrZmaHQbzanhFTohkXL2OtkPlV8R3nOGJPPwzCSOhr64fs6WrfCun26
         ZgyFOoVMh0KmJYcZCAPEHdg+5OuPAREVPIyUOQmvZT/kqVJjbnWLhbXpDAqVIamy2dDh
         Fs2e9lPUFQjMuaqgX5CEP/cAmx7gYTRtQc9fg/8JmuszuPPpuUzgseYcQ0HnTPtmUdF9
         VEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768653011; x=1769257811;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=y4m/7Bfur2xzRjYnG86QrkUmg9v434JD51BbkdRFTRE=;
        b=a7VUln2RKgyHcasOxVrO18SLIFwPVNpZon6Nov+Vtj0nZuH/DbjBHkN7SivVIWSpzh
         T3t4YCy5gh8yUTYDWuwIAYbTBngNIw9jUt6lHBKOSoMOCeA7GX14ZmkPM6pPiLTZ5UaY
         CTHS/Lt5xRKudMAClDOhFFnKbrFJX/pBLLPp+Zl32YukoOXTk7/AnUGcs6yA2+IxZkZ/
         Vr5qk0xDh79cheCXV0fzbogjcPmzlDq8rRhxKJyHOZ5sF+f3j2zNh2/cANiEC2bsJim8
         1WzhnwR8SWfP1YYGWrtYCz1B2VcXJ/LLmNUoJMgxeBoDnFpBOnRSwHblqngfqrYXRf/X
         Kqcw==
X-Forwarded-Encrypted: i=1; AJvYcCXFzCaL5SwkbpYSRUEE/VAV9dsMMasgLOJRfDsrOk/L3Ces+DXw1xexkBeqdURWVX+TgFs=@kernel.org
X-Gm-Message-State: AOJu0YyuV4cnyjWxINuxvJ2EIaNCnefpWzPOih+23rPUX7faClV2aNIc
	GmA7eJIDfNvDeS4gbl/lLDZWdo8et5vhIeSNGUuMSXZkvA6YsguK081FrNFFety1XlY=
X-Gm-Gg: AY/fxX5geFI7+Je7QrY66aFQxcThGBw8o5d49oru8Q4me8cYtQuzPd6sn4LQW5Yyi5l
	LzjQNp+ax2wMhMhYGuFKnxi9C8u5ZTtOLA5jLcOsY2hehemi5orOEe95yrIn5mypzhcm9jAr7h2
	JyL6zq4sXv0wC/uzXZw8tEg4VHSegZfX5ZEK3IQQzPNSQCwK0espeviExI1an3FujsOkaoTDXdv
	xUPD/dR6tsUJjo0JqdDBkYS8W3FSU/jKDsERu7/iyLENKmE8Udh56Dk13os9Qkr7yBoEKkM3jKs
	+gtt9OGsHOJTjYbHr0I4TFq8So77rjX+zCxyKbW7SHrjE++mRIpC71pKsjwQj97Wvwj+YkDU9DH
	86NvOkellg2sXCj76Qkh0nfFdpyIA6gK9lW8/UOxMYaRerFA431yytV1pO7+jXhcr8PVr6e0nQJ
	DfUcbEI74AajmbZyk3UqwFwzllJnfiVaOB6DVvgH3YbqL481gl0K/AXlaD5ODUociHZd/XpBY7o
	a2AyRg=
X-Received: by 2002:a17:907:948a:b0:b7a:5c1a:85e with SMTP id a640c23a62f3a-b8792e2f94cmr478693066b.23.1768653011270;
        Sat, 17 Jan 2026 04:30:11 -0800 (PST)
Received: from rayden (h-79-136-84-34.A175.priv.bahnhof.se. [79.136.84.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959c9f98sm553325266b.42.2026.01.17.04.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 04:30:10 -0800 (PST)
Date: Sat, 17 Jan 2026 13:30:08 +0100
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE bus callbacks for 6.20
Message-ID: <20260117123008.GC255115@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello arm-soc maintainers,

Please pull these updates adding TEE bus callbacks to let the users of
the bus get rid of the struct device_driver callbacks .probe(),
.remove() and .shutdown().

The maintainers for the updated drivers using the TEE bus have agreed to
take these changes via my tree, with the exception of the maintainer for
drivers/firmware/broadcom/tee_bnxt_fw.c, who has remained silent during
the review. However, the changes in the drivers are straight forward so
it's better to take these patches too rather than excluding them.

Further details are in the last patch set:
https://lore.kernel.org/op-tee/cover.1765791463.git.u.kleine-koenig@baylibre.com/

Thanks,
Jens

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-bus-callback-for-6.20

for you to fetch changes up to e82d0477fd80707221c3d110f56d05506de2698c:

  tpm/tpm_ftpm_tee: Fix kdoc after function renames (2026-01-15 10:28:33 +0100)

----------------------------------------------------------------
TEE bus callback for 6.20

- Move from generic device_driver to TEE bus-specific callbacks
- Add module_tee_client_driver() and registration helpers to reduce
  boilerplate
- Convert several client drivers (TPM, KEYS, firmware, EFI, hwrng,
  and RTC)
- Update documentation and fix kernel-doc warnings

----------------------------------------------------------------
Uwe Kleine-König (18):
      tee: Add some helpers to reduce boilerplate for tee client drivers
      tee: Add probe, remove and shutdown bus callbacks to tee_client_driver
      tee: Adapt documentation to cover recent additions
      rtc: optee: Migrate to use tee specific driver registration function
      rtc: optee: Make use of tee bus methods
      hwrng: optee - Make use of module_tee_client_driver()
      hwrng: optee - Make use of tee bus methods
      efi: stmm: Make use of module_tee_client_driver()
      efi: stmm: Make use of tee bus methods
      firmware: arm_scmi: optee: Make use of module_tee_client_driver()
      firmware: arm_scmi: Make use of tee bus methods
      firmware: tee_bnxt: Make use of module_tee_client_driver()
      firmware: tee_bnxt: Make use of tee bus methods
      KEYS: trusted: Migrate to use tee specific driver registration function
      KEYS: trusted: Make use of tee bus methods
      tpm/tpm_ftpm_tee: Make use of tee specific driver registration
      tpm/tpm_ftpm_tee: Make use of tee bus methods
      tpm/tpm_ftpm_tee: Fix kdoc after function renames

 Documentation/driver-api/tee.rst             | 18 +-----
 drivers/char/hw_random/optee-rng.c           | 26 ++-------
 drivers/char/tpm/tpm_ftpm_tee.c              | 35 ++++++++----
 drivers/firmware/arm_scmi/transports/optee.c | 32 ++++-------
 drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 +++-------
 drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++-------
 drivers/rtc/rtc-optee.c                      | 27 +++------
 drivers/tee/tee_core.c                       | 84 ++++++++++++++++++++++++++++
 include/linux/tee_drv.h                      | 12 ++++
 security/keys/trusted-keys/trusted_tee.c     | 17 +++---
 10 files changed, 166 insertions(+), 140 deletions(-)
