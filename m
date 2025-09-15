Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B225B101F2
	for <soc@lists.linux.dev>; Mon, 15 Sep 2025 17:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757958603; cv=none; b=MKVt6KKPQcLx3DcQVXH1cEHA2R7DrKv1vJYkdAsqpYmzObCrtM507APNIjMLRUy3oh4ij8BN7bfWMBdeV1/4Qk7yv5m7wUbRRoZZE01D8DKQoaj4L2++FsO9I98hZq5PwHgnkrYAc5FxAo6KPPZKW1SUAcwkaUcl0Cvh+FeUqek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757958603; c=relaxed/simple;
	bh=X63k7EEPfIbzkbijj+NF+KbsXIHwYBQ6N5O3W/nlNx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ewDYVFrQp25T22aiCNLZ1xGdsRTzkq5JZAHC26Awx5H5H1PELQFBggPPNSAMKN9kEkplxb2HNS0EZ0j8qOhl3Biy++8YmthPVWqDyclMLEoWnKJNytIzL1vjZdtfCNei3bG9yDlakykyO0gHhWB0vgh3ANW4ah3gKoOrhyWTR2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bIHXxBjW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bIHXxBjW"
Received: by smtp.kernel.org (Postfix)
	id 4EE62C4CEFC; Mon, 15 Sep 2025 17:50:03 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3E8A7C4CEFA
	for <soc@kernel.org>; Mon, 15 Sep 2025 17:50:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3E8A7C4CEFA
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-352323389cdso25258401fa.1
        for <soc@kernel.org>; Mon, 15 Sep 2025 10:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757958600; x=1758563400; darn=kernel.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8nUoHh/QaA/cJemcuKzQ0L0kM7hvamnSwD+AbhFj55I=;
        b=bIHXxBjWDl7uhjLUK+PjZ/kgoLiloWEuUA0jgAyFSNJ05HiCqztXadoWnOe+NCLaZb
         DsvA4IVwzVhS6bLduI7Kyx6TAmFAtub7Ab3h7ywB31lWdkxjsDys6rJ2psbHwEeXkRAo
         DmK13RLnWUKwboyzdEm8MzMfiWn4MleErGRFBoa55877ClTBc4Buo6h8n2YYw/4kACVc
         dNudxSHSgGp7zkj2pY88dVmO+rw1R5G/kUMSLYnb6cDZZYVW542XurZPpd0qP8qELUoH
         h3oJkogOcdqKlG1oL5t7vDaEIFoExDPG9DBRHrdoTo/p6+6J0WS3rcwtrE0DXbZ6uCzb
         +0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757958600; x=1758563400;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nUoHh/QaA/cJemcuKzQ0L0kM7hvamnSwD+AbhFj55I=;
        b=oIL46+xukIcj1aH2RLYNkvhocfVQ0GAUkEGsoZ7jwS9RNTcvbQDqDuEvaJ8f21TA7M
         dH0tMZgNp/xuij9ZpGMVdbdELFvqMcRst2y4O/PSkj+DcR5l6KtvTwHkf5znaeXkaTu0
         tupNGwhU4pqFZ09Z3/9wJ8HUm+i2eLExlEEaq1QtU689TRyGAZzp99O0gFNgEfKmWt7m
         iZ2NuPUvUcuHMO3VaORQFsk6yW2A7dStvNUSXPAgfiPe0QYLifK71yDjXzNB7c59zzUW
         6IK2h89N/E0QQsVrQ0otL8IodepC5Ii+92VhJnRUX4eD6gASXLRMOQHZXhZtbcmrwwvU
         U7tw==
X-Forwarded-Encrypted: i=1; AJvYcCWUzIWqEmZCSv5BwrTPmGwnW2Ki8m7PuWArl1RHn07oTS4jI0/7lux7H/yAo2JVIVD3YPw=@kernel.org
X-Gm-Message-State: AOJu0Yzh2LHaWcRA1+GT4KHVxz9fAzf1/hZV5NyazGDMveZ8XyTXS52R
	VmcDFflr5NiARmU2GC7ayeMCBdU6UCSIPca14Ti7atSORvhb96GcKvkpTnp3mQH6fh0=
X-Gm-Gg: ASbGncvmQjoVGzjzQeQEXEisB2+jWEHUxJ59Qle+m19s0q25ORdM2OatIs/+OdwvSyA
	j5ZmpbxUfm+hS/HKm4Mmgx0Q9b6cfYr/YBz9+GeRaBO3d23e7buWrrkq1zS/TyGpmwF/p9K1Tqh
	ygV5U24eQzWFJXxaSt/Skt1NobMohM12JMv6D1Wv/4XPH/g+eW9G/1+LUeKIPllIon+DMg3116x
	hpJLs0k61rbo5jdXnVyyefntsziuucL+m7/a4CYL2iDOlI198mkAkDH+KBbHuv7mR/nyomfFOfP
	Z3gzj8tY6OD2binNNAzY6fAVPEVBNErcNTvlIf8zJD0GTa9LUC6Drj63o4tpasKaa1EvFg5ANgg
	PLaJ+22CrNZp3n9s2UuQvcbghXQx18WFGOqaUxo5iXId9QnBCobXxHiSUnOUv48q6rha9NKN/f8
	I=
X-Google-Smtp-Source: AGHT+IHXonlyJsEwptAZtH8gqbNV18Yqqkb2gFcaLd8EoBqiR9uHczu/9wCsppE9vHLym1iN8/0B2Q==
X-Received: by 2002:a2e:be1c:0:b0:353:dece:550c with SMTP id 38308e7fff4ca-353dece59f4mr29367421fa.37.1757958600095;
        Mon, 15 Sep 2025 10:50:00 -0700 (PDT)
Received: from rayden (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b2a925dsm27634961fa.46.2025.09.15.10.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 10:49:59 -0700 (PDT)
Date: Mon, 15 Sep 2025 19:49:57 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: [GIT PULL] TEE add QCOMTEE driver for v6.18
Message-ID: <20250915174957.GA2040478@rayden>
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

Please pull this set of patches [1] adding a Qualcomm TEE (QTEE) driver to
the TEE subsystem as described below. The QTEE patches depend on two
patches from branch
'20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-2-17f07a942b8d@oss.qualcomm.com'
of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux

Björn asked me [2] to pull them from his tree.

This pull request is based on my previous pull request with
tee-prot-dma-buf-for-v6.18 to avoid a few conflicts when merging.

[1] https://lore.kernel.org/op-tee/20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-0-17f07a942b8d@oss.qualcomm.com/
[2] https://lore.kernel.org/op-tee/mir6lhkj456ra3i6w7def4rrtzw663f66l66cz4s3gxxvueeqk@ils2hjklbp4y/

Thanks,
Jens

The following changes since commit dbc2868b7b57fb4caa8e44a69e882dcf8e8d59bf:

  optee: smc abi: dynamic protected memory allocation (2025-09-11 11:22:43 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-qcomtee-for-v6.18

for you to fetch changes up to dcc7a571a3665a16581b5b18ca6b113f60a9a41a:

  Documentation: tee: Add Qualcomm TEE driver (2025-09-15 17:34:06 +0200)

----------------------------------------------------------------
Add Qualcomm TEE driver (QTEE)

This introduces a Trusted Execution Environment (TEE) driver for
Qualcomm TEE (QTEE).

QTEE enables Trusted Applications (TAs) and services to run securely. It
uses an object-based interface, where each service is an object with
sets of operations.

Kernel and userspace services are also available to QTEE through a
similar approach. QTEE makes callback requests that are converted into
object invocations. These objects can represent services within the
kernel or userspace process.

We extend the TEE subsystem to understand object parameters and an ioctl
call so client can invoke objects in QTEE:
  - TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF_*
  - TEE_IOC_OBJECT_INVOKE

The existing ioctl calls TEE_IOC_SUPPL_RECV and TEE_IOC_SUPPL_SEND are
used for invoking services in the userspace process by QTEE.

The TEE backend driver uses the QTEE Transport Message to communicate
with QTEE. Interactions through the object INVOKE interface are
translated into QTEE messages. Likewise, object invocations from QTEE
for userspace objects are converted into SEND/RECV ioctl calls to
supplicants.

----------------------------------------------------------------
Amirreza Zarrabi (11):
      firmware: qcom: tzmem: export shm_bridge create/delete
      firmware: qcom: scm: add support for object invocation
      tee: allow a driver to allocate a tee_device without a pool
      tee: add close_context to TEE driver operation
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_UBUF
      tee: add TEE_IOCTL_PARAM_ATTR_TYPE_OBJREF
      tee: increase TEE_MAX_ARG_SIZE to 4096
      tee: add Qualcomm TEE driver
      tee: qcom: add primordial object
      tee: qcom: enable TEE_IOC_SHM_ALLOC ioctl
      Documentation: tee: Add Qualcomm TEE driver

Jens Wiklander (1):
      Merge branch '20250911-qcom-tee-using-tee-ss-without-mem-obj-v12-2-17f07a942b8d@oss.qualcomm.com' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux

 Documentation/tee/index.rst              |   1 +
 Documentation/tee/qtee.rst               |  96 ++++
 MAINTAINERS                              |   7 +
 drivers/firmware/qcom/qcom_scm.c         | 119 ++++
 drivers/firmware/qcom/qcom_scm.h         |   7 +
 drivers/firmware/qcom/qcom_tzmem.c       |  63 ++-
 drivers/tee/Kconfig                      |   1 +
 drivers/tee/Makefile                     |   1 +
 drivers/tee/qcomtee/Kconfig              |  12 +
 drivers/tee/qcomtee/Makefile             |   9 +
 drivers/tee/qcomtee/async.c              | 182 ++++++
 drivers/tee/qcomtee/call.c               | 820 +++++++++++++++++++++++++++
 drivers/tee/qcomtee/core.c               | 915 +++++++++++++++++++++++++++++++
 drivers/tee/qcomtee/mem_obj.c            | 169 ++++++
 drivers/tee/qcomtee/primordial_obj.c     | 113 ++++
 drivers/tee/qcomtee/qcomtee.h            | 185 +++++++
 drivers/tee/qcomtee/qcomtee_msg.h        | 304 ++++++++++
 drivers/tee/qcomtee/qcomtee_object.h     | 316 +++++++++++
 drivers/tee/qcomtee/shm.c                | 150 +++++
 drivers/tee/qcomtee/user_obj.c           | 692 +++++++++++++++++++++++
 drivers/tee/tee_core.c                   | 127 ++++-
 drivers/tee/tee_private.h                |   6 -
 include/linux/firmware/qcom/qcom_scm.h   |   6 +
 include/linux/firmware/qcom/qcom_tzmem.h |  15 +
 include/linux/tee_core.h                 |  54 +-
 include/linux/tee_drv.h                  |  12 +
 include/uapi/linux/tee.h                 |  56 +-
 27 files changed, 4410 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/tee/qtee.rst
 create mode 100644 drivers/tee/qcomtee/Kconfig
 create mode 100644 drivers/tee/qcomtee/Makefile
 create mode 100644 drivers/tee/qcomtee/async.c
 create mode 100644 drivers/tee/qcomtee/call.c
 create mode 100644 drivers/tee/qcomtee/core.c
 create mode 100644 drivers/tee/qcomtee/mem_obj.c
 create mode 100644 drivers/tee/qcomtee/primordial_obj.c
 create mode 100644 drivers/tee/qcomtee/qcomtee.h
 create mode 100644 drivers/tee/qcomtee/qcomtee_msg.h
 create mode 100644 drivers/tee/qcomtee/qcomtee_object.h
 create mode 100644 drivers/tee/qcomtee/shm.c
 create mode 100644 drivers/tee/qcomtee/user_obj.c
