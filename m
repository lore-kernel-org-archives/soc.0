Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA64728C85A
	for <soc@lists.linux.dev>; Tue, 17 Jun 2025 07:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750145537; cv=none; b=KAT+vioxS2AsFgr0XUDQUcKuXxF8wtlpotAkxWsXgVMbW1FQ7DZjsE5nmek0drnzWsFz+fk8iZ7Bq/0w9BwzLZoOJ0C5q67QZFO6QRQNUqzaywDVIZvJqIYxvhca1rglbPXac9necbfBTPT9URUi3rYiRN4bSBj9AOCEFcqKrbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750145537; c=relaxed/simple;
	bh=rMddHsA3nzBTFN0QMqBt9MpSn7HX6CFwqw9BP1SyU0c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EsUWw8H6aaT60GItah7fzbecAJlPbsHC401K4IIy7M3xJPJKA9S7CYIHgeBF7tnoHbTsJcfBjKOojw7eKZ93fcOCz/hXdjC8tsjG7locMap/WIpOABABd73xx6MFQznCwUp2qEt1ke5akQtecHukhayFZxRA7VLJG3plOVTYG4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueQuu83y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueQuu83y"
Received: by smtp.kernel.org (Postfix)
	id 80919C4CEED; Tue, 17 Jun 2025 07:32:16 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 728E4C4CEE3
	for <soc@kernel.org>; Tue, 17 Jun 2025 07:32:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 728E4C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so11294579a12.3
        for <soc@kernel.org>; Tue, 17 Jun 2025 00:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750145534; x=1750750334; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DitCPFk6i35uURXkN5+J10Jk6mGckO0efyDQ/Ffatgo=;
        b=ueQuu83yUd1yI+3LfbVErws6Qykv57F/j1WeBsXbPIky5kSdkjVJCBsqLzVrg8x197
         qZ+Zqz0jFrjWcgGYzSab4DaODhDdxYkZh3BQwB/67qOPrFMGecX5qgjMY+0nKodCdYFQ
         igjeCv/sGfsWHdd8xFzUDsXtR7y9ZcM620IyNpX/wvB3dahaZLk0mPbU79X1N8LPh422
         T7fyXbXT+q5a90hr5L0S5WI5UcYpiQlrJEEEZIK12M+QxRgdb/QUZn9UuCg95OkIeNtc
         A7fR3sNwmtB754OryQuk04Lv6BX3Ijfvo1duzUx3hsAxYHpoeC1+DTG5vSXNibhsjed6
         hHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750145534; x=1750750334;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DitCPFk6i35uURXkN5+J10Jk6mGckO0efyDQ/Ffatgo=;
        b=YeC4StWgS6NGjrlEsLkq3/Vha5Py6U/5zCqQSCxdX1zAyWpM5Q0OT3209r2zQm5/eM
         FgKSrRn+0XP8uLnx9eygFa88nSEZUKDYhG/7WRzlFKOY3IerH+VOeStVnKpXvkkd5tUg
         2pvuqQC6F1r5Ky8OdJ/zY6O20CC5QokJ7GBLKUL4rRxztjjHPSAUgVa8WoAc0SHerKkk
         BUdmZrpjlPcKlbJmHHOWUDAmpYt0Y49AJng1j5tWk5EmsMUcz7rU27e+Aeje8+dmWLTY
         EpuXDBzlTUYZdqdtcZ5ncaIs6uWbLjFWoeWMmcTKUPHFsMxi7OohaaFuOVN3ouPjS8sH
         /E2g==
X-Forwarded-Encrypted: i=1; AJvYcCWGLTKjymawVwTVjraVZclILZ5WFkXmXLN7JXVITMoQ2slWQNf91CaUL0qIIF7Je3uiO/U=@kernel.org
X-Gm-Message-State: AOJu0YxJGJxhZ0UK50qinkUAE+Otr76bocLFhgP0UBSpIpsHk3Ccq8FZ
	ErgDpqOQ/6zV0Jso5A1JpP/Q5NHwnWhZuYJkoeVNiOInMW7gXKz0W3LczGOGrjXUGYU=
X-Gm-Gg: ASbGnctCCwjQms+GeOmEVG0VXJ+uj+o3/2k0lfG9sl8VYVX5EofBDE0e+ZEL7Xg1VGb
	Ajk9yRQS0pn5noaQLCVbGehDyphxG8lR0leACpTHJY0/NcZ087u4oe94tzDVwwRVrbHIEKJj4wi
	netCUB9PPoH0uNs5GT/+1NQwezrsHnhGZKp7FNxRr1cWXjVTQXecny7BbSYvsHFNNNCBgyS5TR8
	W1BOBmILeWwspS5JyZzThEJyo1DrecPuNf0YYNUrz9le5EvRn5dSXJu6nCK65SImprINax9wdh4
	T8OT7iAnf3gwtUtUQaA7iQmC1SulOhXganPun9N/pP4g0Jwlb5+JxcbPBSs7tADWcpdPGMTmS/F
	oE+hqudY0mQ1/BoF8p471mSjZz0MC
X-Google-Smtp-Source: AGHT+IH9/yGt1B2R5aOqGlO4giU7a4MpvEhipVbdlnV+bODahZF4ciyHZm2yTFfr8OIZsO0wiR54nQ==
X-Received: by 2002:a05:6402:4402:b0:607:d234:7d8f with SMTP id 4fb4d7f45d1cf-608d09af98emr11886262a12.33.1750145533721;
        Tue, 17 Jun 2025 00:32:13 -0700 (PDT)
Received: from rayden (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a5e72csm7605436a12.48.2025.06.17.00.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 00:32:13 -0700 (PDT)
Date: Tue, 17 Jun 2025 09:32:11 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] OP-TEE fix for 6.16
Message-ID: <20250617073211.GA1005592@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this patch for the optee driver. It relates to the FF-A driver
PR https://lore.kernel.org/all/20250609105207.1185570-1-sudeep.holla@arm.com
but it makes sense on its own and can be applied independently.

Thanks,
Jens

The following changes since commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca:

  Linux 6.15 (2025-05-25 16:09:23 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/optee-fix-for-v6.16

for you to fetch changes up to 312d02adb959ea199372f375ada06e0186f651e4:

  optee: ffa: fix sleep in atomic context (2025-06-12 12:04:57 +0200)

----------------------------------------------------------------
A fix in the OP-TEE driver for v6.16

Fixing a sleep in atomic context in the FF-A notification callback by
adding a work queue to process in a non-atomic context.

----------------------------------------------------------------
Jens Wiklander (1):
      optee: ffa: fix sleep in atomic context

 drivers/tee/optee/ffa_abi.c       | 41 ++++++++++++++++++++++++++++++---------
 drivers/tee/optee/optee_private.h |  2 ++
 2 files changed, 34 insertions(+), 9 deletions(-)
