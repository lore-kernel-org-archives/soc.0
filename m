Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67941FBEB3
	for <soc@lists.linux.dev>; Wed,  8 Jan 2025 12:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736338503; cv=none; b=shSLFaHtXsIsFrAFOmZMldEsQ+JKnvH9ADXgqNTB5TF7hb2PEf9UEpBHexEyId45GFft0XFRDnwu5WTDOTEtWM+0avXRBqxptkRJ3JK0sLs9ElMQrc/bbZ4qQ2Iin8oOUWGhNOfQhgJ+L4BpnlfT9f3t0XzeG5ZSB+oYcXxD+CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736338503; c=relaxed/simple;
	bh=l4ta6H5DKmNKhTAGYmdzQgtVWRxs0QP3ql8BDZ1L+/I=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=MuKt66gwIWw32ovTeC+Bey66GorGNLAAaJnNTfShEVOdE7baRaibS/15MnBn2OQ4jqCEs09xXdRf4n146FRl0FWFAijEXxoE2rcRraBsQVAF7UqpTfEfuf4Q/j2qtfo1R5yPrEwdYsOcho3LAVzrfL5PMdG5BL05oiEWDYVKcvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mucqZy7I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mucqZy7I"
Received: by smtp.kernel.org (Postfix)
	id 83BBDC4CEDF; Wed,  8 Jan 2025 12:15:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69625C4CEE0;
	Wed,  8 Jan 2025 12:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 69625C4CEE0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4362f61757fso165356425e9.2;
        Wed, 08 Jan 2025 04:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736338500; x=1736943300; darn=kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJmTv+KjscVDVpip0BiVAIpbXRVtsfL2L/KDsAFORfE=;
        b=mucqZy7I9XFK2S5uFQm1qREUS+6dV5y6PTdtSlzd2tvZToaJQNfXxC7nEq+AmklB7n
         0Dxo0efa0WUmAcawNxnuUBC5K0bUjBK0HwVtFdlvRtYkN3b4qjnOBPyTyl3YhBs695mY
         IyZHHuhYLxWoj2oovlz5PisnVoqd2I9DjUKXOoiH2YmF5bz8JNSI+EAexJlEUXyv5pEk
         WeHz/ALdWYetT3BKyMkT8MhkbryceQCbTPN0nrIERKH9X2xV2CJAtrFitVc8SOv4D9DC
         h5lsQcCSeYwdCyEiWelNYjGR6hvBm8CCelm5Cq9jyEaUPFSO5jgalwI1DitHEY1nbIZ8
         wNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736338500; x=1736943300;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vJmTv+KjscVDVpip0BiVAIpbXRVtsfL2L/KDsAFORfE=;
        b=aLulQJZT+uYvSJ26SpP5NoIXK3JkwHVw6eUptY1xSZgw5O1Jn097vXXeR7AT5p1NpH
         l4ImTpl0kv8jrhY7aaYgZUMmi9vJ9sIzBwZenjNqA7fgHcK4BYptWFFdaZ02cI25C3HC
         hraNs2Vsh7QYLsbd+snlzb7CvboUIevseixZd3pMkv8XBIfOj6XEFv66zaN/DRdy8LOg
         Wwykb4WBnizXjBircGS2/vbFnTmgFQOHwrzez2uV/CAW/cuHocxFOzBrPvxJkC1vUMKl
         ezF8TUgz74GHqDBi6MTKNrPzCIZdQLopq8V/2hN/tpsXZFyS8P22lOnBOXi9FR9t6qXs
         9tMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwR4t5qdKg261LG761LiWLj9nbEWiEIlXr0N/leQS2yl2Z3LeIqiz55Lij/hQitu9UZk0=@kernel.org
X-Gm-Message-State: AOJu0Yyd+fSKFfYn99LR9Fz2SytzGCvMTuTKOgctAZnT+Y/AX6Ccta6g
	/4keS1Tyt+C9bitde77aP9s2ksczbVgtc4/27Ng4fjuzKo6gI3wAqMtAjRFi
X-Gm-Gg: ASbGncuol7XgVG8GWP0SN+rdE6cDrgbLa8/u2mMUqB1BF5OwxAoWLU4yZMdcBT8LGj6
	pMr2K+RJnnyA6eWV/b629+3JXjQrFcjrvXoyi2vFsHaob4pbQaSL/83NDLcZJln0ENmRs6xzX9Q
	uUJiZYC7TUVSaKJoGTiDkrZJqsxMOlIUuersTkJzpPok0BLx8tpINlHTXb8TLA1kxQHTThc+1dy
	LR3BsoIzRaWBx2mtaBHPGTbL0Adg43Qju3962lz+rhXUn32jFd4UqVXUxRnSfBJzzCHD8yy9Ekh
	kFRfGSqYD2BcoieZqpXQeHs=
X-Google-Smtp-Source: AGHT+IFlV40g81acpz+C6YMGGUm7izT6zhq4OhN0NjEMOos3WDWwzDbZk2fc1aPx2QisQ1Y0idOlZg==
X-Received: by 2002:a05:600c:5246:b0:434:feb1:adbb with SMTP id 5b1f17b1804b1-436e271d5d6mr23289225e9.31.1736338499475;
        Wed, 08 Jan 2025 04:14:59 -0800 (PST)
Received: from [192.168.0.31] (80.224.71.185.static.user.ono.com. [80.224.71.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e89ca5sm18859145e9.29.2025.01.08.04.14.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 04:14:58 -0800 (PST)
Message-ID: <ea93d0ea-a1a0-4d36-8880-4f05c85f0c1b@gmail.com>
Date: Wed, 8 Jan 2025 13:14:57 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, ca-ES, es-ES
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>
Cc: "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [GIT PULL] MediaTek ARM32 DTS updates for v6.14
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Arnd,

Would you mind to pull the following patches.

Regards,
Matthias

---
The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ 
tags/mtk-dts32-for-v6.14

for you to fetch changes up to 90234cf9b37c57201a24b78c217a91a8af774109:

   ARM: dts: mediatek: mt7623: fix IR nodename (2025-01-08 13:08:20 +0100)

----------------------------------------------------------------
mt7623: fix validation error of ir-receiver

----------------------------------------------------------------
Rafał Miłecki (1):
       ARM: dts: mediatek: mt7623: fix IR nodename

  arch/arm/boot/dts/mediatek/mt7623.dtsi | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
