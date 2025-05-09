Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F069826AA91
	for <soc@lists.linux.dev>; Fri,  9 May 2025 06:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746773480; cv=none; b=OT3fRGADblpa8YD/5XM5Ls+JdOjeoXVwAYkKlw15G5WpHFSlgv8a8AF2TE1HN3eR78/ViQP+iFiUZEgulcD0Z0e0qj6Oncix8OzCdXcnCaaiFbIu0bNAb7C4pVbt1RFuLwjThbTafabwvWCA38UcyHn2cXSZjdvF3dlTniVHmbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746773480; c=relaxed/simple;
	bh=AF5fpfzqJ+Ej96B9gVRXqWtxyZAB5RD/WG1QkctopUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jn55wnPYptju20CipDTFnR4iRMJe7jHJeGznH5cnZj140gnjPlohMlsXDEcDmUFD4o9c6v/GarVkm50w6XwmtWZWYFVH73A0nZTXSHN33mdoZdL8frjkDODxXkytpSCbZQ0uYlBVCoGsy3xKqHoLvhfbyDAIkFvj9hldrgpo/G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=buA31Ji7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="buA31Ji7"
Received: by smtp.kernel.org (Postfix)
	id 87BAFC4CEED; Fri,  9 May 2025 06:51:19 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A4F89C4CEE4
	for <soc@kernel.org>; Fri,  9 May 2025 06:51:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A4F89C4CEE4
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5fbf007ea38so2898576a12.3
        for <soc@kernel.org>; Thu, 08 May 2025 23:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746773477; x=1747378277; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYBTfNGTTnEFB0aMh2qxUzJsPyPpesZiTr/JW3zojpk=;
        b=buA31Ji7dkP2A0pjbx0Q9h5cuHTOTm7D+op3lLdWqy/FMdxu6zjEpgTU0JhKd5nvI2
         8KXkbudiG7btWpC2J2xrAkAcpTlih4dKf+mMKjgp1LnTPnFa7TWjnist5BH35LV5Wa9r
         qVrRFE2w5YCNNxAhP8gd+4hWG+GnvJQ51+15AMUorm40l3lViAG1p7w0cZGMAAPUcCGM
         z5DVD1SCZJsfERCAOJz3e3ySweaF9Dg2XjspJBBIENMB3At8LUoYyT18QvrFo41FsHzp
         6Pqbp2oZj3dwfzR3Vv9U6AKfAC9dSDsnFsZKrjyYe4AOTFNswgaDFwwjku420+i6kqHL
         MqHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773477; x=1747378277;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYBTfNGTTnEFB0aMh2qxUzJsPyPpesZiTr/JW3zojpk=;
        b=s5Z1m7WzT4Iux36AHNWC/2DiBD4Klwfkfq7LhcJlVieb27ZMhccBpfGzyTKyKzpIJz
         I7DpC3s+mdot9qHlGG75HfQilqTF56NsH2TXHJvlFW9j0Tk/GY1r+HcN22BWKJEma+Fu
         uETEWkXZvsF37v3F5OrwE2kqO1x/680Mg6k+nGm+koE20nqvJ/4axYBLNNCXFm64pVnZ
         z4atCQNS5a0Dv8fRjsNx8alpU4iX8Y3dxHJ1Cdfd1nXXMJBwY7u1TvCQS8SRDNsyp1+k
         TXVbJ1oZ4BezU8Awdda2KKkslQB0P5xlpCbbpgFn+zcg6cXgyp3AVJS0UOJz1HqIQONp
         qJ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVG/MhowUU3WvR7YRIxuZGbZItl9+FIRgrmBlsc9DHUKgvXbJJDUSHRJmWuNOGHrO/2cZk=@kernel.org
X-Gm-Message-State: AOJu0YznnENeil9TYt8LNf3vF9FwK5qUsf89xlyIsNZ9ctsRsUXkQ5VL
	gdjaOZLYUPOZkj39uU6LJhckClnw/UIQqZ13NLspoVFE3dv0zjLxnrBNibwAOL0=
X-Gm-Gg: ASbGnctwGN1IwgAFsPBTU7QE2Lh7YHDw5YP3jWHnmNvYod6ZYnt7eWPAKRBru8hwKf7
	tkdvkELJAEx+Ewa8/imFNHuPDoWuZ1Gy0eFo47pAxngqiE79hSMuK/NT9sM/Mw7oiCZ/ZgvAZNN
	HPIxuAgQnAb70wd3tQPVeUlmLwa/CjaqOnqKTEzJRL8HHgeq+B/QO476q33Ltkm7Tuz3Cx/B0pL
	0nzCHSRih9yHNfre1/81aQ9+tf+h1Ah4o008woSCVQZuoocmlTIp58jk37/46GcEypCtb7G2+Wt
	8Klnag9WsC71KbFvqqjp1BTiNphRbTT1oQh2Q/4O7gw0HbQ0knqECGwN3nxOGoD1zsTjjUIRQlt
	9IxJoEb0=
X-Google-Smtp-Source: AGHT+IGEq7s1cGa8nS1cxj9LzdihYh5cljT0mvPGw2cCH0VhEx2xs7QLyoyuTIKGYy59vJPEyiabaw==
X-Received: by 2002:a05:6402:13cf:b0:5f6:c4ed:e24e with SMTP id 4fb4d7f45d1cf-5fca07eb917mr1808116a12.27.1746773476973;
        Thu, 08 May 2025 23:51:16 -0700 (PDT)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9d7100d2sm955653a12.80.2025.05.08.23.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:51:16 -0700 (PDT)
Date: Fri, 9 May 2025 08:51:14 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE updates for 6.16
Message-ID: <20250509065114.GA4188600@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull two small small patches for the TEE subsystem and OP-TEE driver.

Thanks,
Jens

The following changes since commit 8ffd015db85fea3e15a77027fda6c02ced4d2444:

  Linux 6.15-rc2 (2025-04-13 11:54:49 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-for-v6.16

for you to fetch changes up to 39bb67edcc582b3b386a9ec983da67fa8a10ec03:

  tee: Prevent size calculation wraparound on 32-bit kernels (2025-04-30 14:57:03 +0200)

----------------------------------------------------------------
Small TEE updates for v6.16

- Remove an unnecessary NULL check before release_firmware() in the
  OP-TEE driver
- Prevent a size wrap in the TEE subsystem. The wrap would have been caught
  later in the code so no security consequences.

----------------------------------------------------------------
Chen Ni (1):
      tee: optee: smc: remove unnecessary NULL check before release_firmware()

Jann Horn (1):
      tee: Prevent size calculation wraparound on 32-bit kernels

 drivers/tee/optee/smc_abi.c |  3 +--
 drivers/tee/tee_core.c      | 11 ++++++-----
 2 files changed, 7 insertions(+), 7 deletions(-)
