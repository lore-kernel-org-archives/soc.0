Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86A22063D1
	for <soc@lists.linux.dev>; Thu,  9 Jan 2025 23:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736465870; cv=none; b=bTzAQYvD3IOrGhV4CbSxkAiu+MGPaGlazf66zK18Zzyjyl36hkeTS+ZTvwWiwtVsRYb7g41+jAR8PNV73RkDPQrn2Q49qpyrKTbIcrgSDfdAK7rLyXyoADMGom9oqKXz92JyCNwwOH3NMLPRg049lBTOW/54XIv+xqnod7QNB88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736465870; c=relaxed/simple;
	bh=pLAZdElQQ+Klq45pGY/ZtKByOFB1tdiPuTmXgIET2nY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=F2t9/Dr9j8QxiO8Z5Wpdd7GfCkfLhoQ5KviYydfaTMVPEdW/diNdjFhmq40wJyP0WjCs37WQ4HzYsEVozr+sl8pljjuxIVvOyLKAxzk68cZ5CqlPIABsL1ZtmW8y4IFsLUb49+nks/+SWy1WI/B3n7toOEb7IFZsTDZ/e/zwfSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jkvwdrxf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jkvwdrxf"
Received: by smtp.kernel.org (Postfix)
	id 9593DC4CEE1; Thu,  9 Jan 2025 23:37:49 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3B8B3C4CED2
	for <soc@kernel.org>; Thu,  9 Jan 2025 23:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3B8B3C4CED2
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2165448243fso26588555ad.1
        for <soc@kernel.org>; Thu, 09 Jan 2025 15:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736465866; x=1737070666; darn=kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=w9XPKCT8QhEaC9tNgTUGx1mSYdmp6MzCOvuxEB6mhcY=;
        b=jkvwdrxf3Z4Y1lcKfiggWPeKq/wz/aXd2b4ZCPHTjPtKjcn47F6lUohJzvUusi81IM
         uNrr/2kU9/NYfWP5Q17ORng404PmkHQ375BMffScpi6Sv6HVHzcQZLLAj1utDAj0R2VM
         V7hPW519KmKmCCksMqwCwVSWZSktO/r3hrAMoauC4icOA6yHIDMs4bhfKzwERFW9l4/l
         4NWZPjFiQlr2Zz7aLlqxqGOIXXJgueZKjdbVy6cUiqRC5HcFCG2LYHHLN2st+UDLjfI+
         rH7f9+O0YPJxAnq69AICSulg80TVIgIPU+Xm9dzpiGsiQa1OS+fhhI8ue1qtswH4Fi+9
         99xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736465866; x=1737070666;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9XPKCT8QhEaC9tNgTUGx1mSYdmp6MzCOvuxEB6mhcY=;
        b=KQauL0/YvaQq/ymJQhk2WhwvsVDwpnebDGh/VyHITFIGQtne5WqOUb3zhjtXw+3nT9
         6CUQO8RY0455OyHW+aZxQa6DwtOPCue/mxsBVJOfbXca1oM3EXBlqOu9JfoFWN9/zSy9
         q9bFEempR5ZDbXLJW9x5AyMaIy7lDuilraDQIR5LOKyzdj+4hyhfGCuX3id/+ATvtZXW
         e3WCQecipARceXbXrxQ0fWWg9CyHnnvwFdecXHy85dr/RSAk47B3rIs49d88MZHaooJd
         cKxGWykCAHF2x649at3bnQCIifC4dpWwMH0cnFNaRDcRh+tGgv9mhcC7Bys9krFudYwZ
         CXyg==
X-Gm-Message-State: AOJu0Yy3frU1RAW+HklLmNHGg92/lesCjYzsGjz/II/QReLhSppx9R0y
	Y4FzuF7g/eNMvXq5MA/+/YHtE0EdpuMdYttPuWScoBCC7Cqx8IR26rEfSPmqwnnW1VsGbIpIBwQ
	Z
X-Gm-Gg: ASbGncsk+2hWa5VaM0ugmzPaMwq+bWT4VB7rWUR/1Kf7/M2rxnAbIH0QCprTYfEJW45
	8+XvTN8ukEvQUZBLjZRIyAWlY8DGZYdO6vtU1p1kcaYe8CKIw6sw6bdcUmKVUzeNhbU14ADHQ/t
	NcyWHgoDWe7XH9dBB5PnmV1BvR4V5NRiRPICAFJLwEin77HurJEyHP8/SKN0m/NfS0FahvZ5DmT
	60nntbZYTSc8IOCHD9aKlWnECs6yj2gBNpeaQTSWc5pcQuf379yc98=
X-Google-Smtp-Source: AGHT+IEfEBVr03htPuKk7GnouY1uEKaeksFavfal49FWtSio2uOLv2gDake8CxsSp5RKbe2PLBGoTA==
X-Received: by 2002:a17:902:ce11:b0:216:49b1:fadc with SMTP id d9443c01a7336-21a83fe4b7amr134857165ad.42.1736465866394;
        Thu, 09 Jan 2025 15:37:46 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219330sm3186745ad.132.2025.01.09.15.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:37:45 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: soc@kernel.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] arm/omap: drivers: updates for v6.14
In-Reply-To: <20250108091348.46f71e35@akair>
References: <7hcygyb3yi.fsf@baylibre.com> <20250108091348.46f71e35@akair>
Date: Thu, 09 Jan 2025 15:37:45 -0800
Message-ID: <7hldvj8som.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Andreas Kemnade <andreas@kemnade.info> writes:

> Am Tue, 07 Jan 2025 15:26:45 -0800
> schrieb Kevin Hilman <khilman@baylibre.com>:
>
>> The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:
>> 
>>   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)
>> 
>> are available in the Git repository at:
>> 
>>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.14/drivers-signed
>> 
>> for you to fetch changes up to 6ef4ea3c944b9fc5d78317d1172cdcd10f9724f1:
>> 
>>   Input: tsc2007 - accept standard properties (2024-12-10 16:17:30 -0800)
>> 
>> ----------------------------------------------------------------
>> arm/omap: drivers: updates for v6.14
>> 
>> ----------------------------------------------------------------
>> Andreas Kemnade (1):
>>       Input: tsc2007 - accept standard properties
>> 
>>  drivers/input/touchscreen/tsc2007.h      | 2 ++
>>  drivers/input/touchscreen/tsc2007_core.c | 5 ++---
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>> 
> This is input, the only reason that is goes via soc to keep that
> togother with
> ARM: dts: ti/omap: omap3-gta04: use proper touchscreen properties

Correct, it's going through my tree after agreement with input
maintainer, Dmitry.

> So shouln't it go via your dt branch?

Since the dependency is not a strict build dependency, I separated into
dt and drivers like I normally do.  They will both land in the same
upstream release, so should not cause any problems.

Kevin
