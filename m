Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9643624E4A1
	for <soc@lists.linux.dev>; Wed, 24 Sep 2025 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758702850; cv=none; b=mjsxIob+LJdWr21ic8OWFQxj0pr9Vg5EjQ7+FnfFZmhi0Z2bzZQ5kpF7BCz8czuWHccJ5X/ruDcddLDG6GQyXG5EDrft6CFZWyVC0oTi+XKp+LmxX54AtwDSmIkKHhsXYW0IAcWoeyp5kNV1cq/bUrB5XdzazCu0Z4JFcDJdwvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758702850; c=relaxed/simple;
	bh=OrATnpZDnlXdQH9ZHMeh5Yq3DhbnbcVfeDmwbff5INc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eY4bLWUzYf5amFaaxOx2dsLiSpbsRmzBCvjXnaH7m9op9Ba72g97/fksGvLm3kFwtYXfH0dCmda+Px0Fa7ZNjMq4ZToUpHWdgAGrJ06iGHpha/bsFlDiyFk2/RtYS0o3Caz73nBL242eOk08/0gX5ppkAxB3d4XTWQ6P5uIO+g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQubsn4X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQubsn4X"
Received: by smtp.kernel.org (Postfix)
	id 3ED00C116C6; Wed, 24 Sep 2025 08:34:10 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 32E2AC4CEE7
	for <soc@kernel.org>; Wed, 24 Sep 2025 08:34:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 32E2AC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b2bddecc51aso499892566b.2
        for <soc@kernel.org>; Wed, 24 Sep 2025 01:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758702847; x=1759307647; darn=kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T2GuLi6XyMMBKMY8TiQINu19CGtecqHLNQuiswEu7fo=;
        b=wQubsn4XQyYAlDzMB5cg7eS7m5HD2ZrIAMkcwfwO9FlTdbnSUxILr6wWa09mrRoNae
         YhriCJJO0xeLbjnBH8an6Q9f0p78fq4zGjxKeOHnD5Hx6qy7z6+Ol1QWKUDa5/TFO6Um
         a3AtbhuhLhuz7anjI4iPz4e1foibrKVxJ7Z79tasERiJxd3ZzOun1SDLgntlliV5BkO6
         w+/C/0OXlqcU5CxAnIPnWTo6ywRuJ83CKLQIzpOobPnLiIPR721elTCJf7LJHwXQIEPo
         9wwtVUvclG+GT3Qc5bQWl5ECt29vWonBLmxnQnbiM5oulSKYV4bw49T4REGFAxKg4NjR
         sIWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758702847; x=1759307647;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T2GuLi6XyMMBKMY8TiQINu19CGtecqHLNQuiswEu7fo=;
        b=IxcpF/KiQu1D1v/1ERqeOLknx2p22N3b1HhxJVafua6kdg5eO/l5OiNnX/az2GmYzs
         ORr6NLIe9yHdPGfE94dUYYWLixvm2PL7KtfXVXVZUHVnUbeyGqPI7duByOJ6ll8oNbPR
         qHBmIWUF0gM2KhuckKGXvXJbfl6GMtAN47Pu/BhBgqurrmXKm3EyL/W1LZX0fdoyW7Ct
         iuA8B4pN4FIDvLklD0B0mAwkZlP0Iv7BYUR48xj9cxlJlErSOs35TOh+gK1CWv/ufgzL
         39Lph607DZeKAdJKJA+yqJoPrOf/EMxQI/YHHnZXqH0VQonE6g637LgWM2eu9iWDfZ8O
         yzCw==
X-Forwarded-Encrypted: i=1; AJvYcCUBCz9F6Ho09oQK/ZEi6J9KToCuGp5BuGv3+Z/H6SwqLXLMUB5J0aELQhMgLTUYeKHxZOc=@kernel.org
X-Gm-Message-State: AOJu0Yy2CJWD5xel9Pf42ISD+3mmxHfev+kqzFoCdVO86zTS9nbp5HC/
	auDgdE9E9qWTUXyH2tRtoWui5R3F4mPBUGcnCFibfzJY+AEC6FyktLr0IPhv0Krsgv0=
X-Gm-Gg: ASbGnctD9YpN508+ICen4yfN7JJQFsxA9BZhvAc/RfpdzwTvu3u7PFrKB5FbixTnPy4
	u7P/MolayO3WRgOqQTEbbtvvwrHvDTlfiWvixF+k/HLjCfVYoKjvsTLd/U5ZJ5UBaiLoc5mduoq
	OrVJ30+axUbcVhRaCD/AHFRlmk9vWiv1brze6gLdW8RTxk73vhWD4I4SvojPwhZz0INMqcmDNC9
	f47VKo2kfZr2w6zws3GLfHVZVZUBhDhF0Ee+dLuY/lbNbIv8fpkmmQ9cmiIIqa2H2LkO7GqNOYn
	XcvPO/XhQZH82YF/g0Znupnp0Hlk9nHYIC4YTjDUxguJPH7Ym798oCY/FSKOcEiqrLpM6jAJ0xd
	TZ2TQJzrilQDNHpTJwnszbxDaElDgr31ZsUVi1JiJ07JYK1rLhY6MUFtWej7lXf49
X-Google-Smtp-Source: AGHT+IH1aDoALWFRsO0oVLqVi+ToUZna4cdMnC32Rm3fsJgeudeKUR1iGh2aJbkhuYEWll04azdH2g==
X-Received: by 2002:a17:907:7e88:b0:b2f:5c41:49c with SMTP id a640c23a62f3a-b30267964c0mr565741666b.3.1758702847411;
        Wed, 24 Sep 2025 01:34:07 -0700 (PDT)
Received: from rayden (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b338b404a3dsm46227966b.11.2025.09.24.01.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 01:34:06 -0700 (PDT)
Date: Wed, 24 Sep 2025 10:34:04 +0200
From: Jens Wiklander <jens.wiklander@linaro.org>
To: arm@kernel.org, soc@kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	op-tee@lists.trustedfirmware.org
Subject: [GIT PULL] TEE fix2 for v6.17
Message-ID: <20250924083404.GA3747732@rayden>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello arm-soc maintainers,

Please pull this fix in the TEE subsystem.

Thanks,
Jens

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jenswi/linux-tee.git tags/tee-shm-register-fix-for-v6.17

for you to fetch changes up to d5cf5b37064b1699d946e8b7ab4ac7d7d101814c:

  tee: fix register_shm_helper() (2025-09-22 08:47:00 +0200)

----------------------------------------------------------------
TEE fix2 for v6.17

Fixing incorrect error handling for a call to iov_iter_extract_pages().

----------------------------------------------------------------
Jens Wiklander (1):
      tee: fix register_shm_helper()

 drivers/tee/tee_shm.c | 8 ++++++++
 1 file changed, 8 insertions(+)
