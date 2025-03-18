Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD7320C48C
	for <soc@lists.linux.dev>; Tue, 18 Mar 2025 15:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311671; cv=none; b=l1ehm6GKTRiqCT5Ebyu3jMJ38gBudLyCZub9I7+lGbCl39wJB739BzqWePqXzOPfFOUubQwD8V/8VRi5DsQ70bzmFTh0QHmzNGKRG8/AV13uQhtgzD86eMj81F1BHxvovzCps3R0EYGRsXRKw71X5QnaqD+NdTA147vxqFp9emE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311671; c=relaxed/simple;
	bh=s9zh/0nQb62u7isnT7ZTZOjoOHQLd+KLI5aGXQFTu20=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=iIpkzL8t+bLFn9w2kNc1sijrBvB+pnJqqc1JpVx5nOL1sf5u3WexF4ExJ7jy8m48YnQMiVljZIXi4rjvWUGEaDjKMC5qcLLk/wZQ15Jb2ttcnJ1UsS75LSA9hj1yJKOfWVwcA/zNfML+rAcV/FBNF3F0YZwPSOTpa8VJWpDJCKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bEByj3aX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bEByj3aX"
Received: by smtp.kernel.org (Postfix)
	id 4FEFCC4CEE3; Tue, 18 Mar 2025 15:27:51 +0000 (UTC)
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C7DEC4CEDD
	for <soc@kernel.org>; Tue, 18 Mar 2025 15:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 4C7DEC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-2254e0b4b79so6591845ad.2
        for <soc@kernel.org>; Tue, 18 Mar 2025 08:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1742311667; x=1742916467; darn=kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9UzD1Ky2bx9uaDef0qVlKrUGPVh+KVmS6RPxnxKCs8=;
        b=bEByj3aXTIbUlqLk7Y09HhGKxx+IQV/MAKf8Du4dZJNSLqrm/fPkrzSC+7XDXmhWLI
         kMYjvax9A69t7AaakBt11YeWvVOJCIkH1GmDbTCLOjzJizJ++vgtGsYLnc+j1dvarIWW
         oL+FlSUQ6FI0qGk4sW+ASj2KPTXARO/DVcy9n1WpP4wqIT8XVvbfdoKgrs8x39k7OAHT
         yQJs6nF1fbThiNieegCtcY3FbZtIOjNY0yi8WsiNnsIRjQsyPHO0ZTRmE55WGzuFwzR1
         pbGaZChOE8n+cSndD/eLxAPWUv554AXkpAR+JGmeaqqpf0MqSKofRW5NGkZJ2+LyWarp
         iuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311667; x=1742916467;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9UzD1Ky2bx9uaDef0qVlKrUGPVh+KVmS6RPxnxKCs8=;
        b=Xp6tQ4MayilcRoCoFzR8ZZh01lj/4/vzyyQ4ykKOBxTDgP1gLqUt47Da17WFvpG15L
         zJQq2nPGlBXLNrRh3MWjY/I6xXxSp6Ee3Pe39YYyOHx56ErHqKafteXwCMK77YWPshU6
         XZ8I0B/GRP8IR6Ui75KZyjSRcIjt8OTIOxjt8A0qixW9eX3ATMc9QDDVI1CvPBaw+W09
         y/5N2QqS6hYGmeeLr6N5bJZcWWpj4SCr/nLPChujcQ/E04zpfUk5qXUP2lNoBg2alct1
         k4P881rga2CJRvhp5l9tgPqHXbQojPAfamaL2debKA67i6UGuRBIibjW6G192lsdp3Db
         PP4w==
X-Gm-Message-State: AOJu0Yz7aROufbBxwUxDdYpm/1rdTk0juQ7xIwHk5kfHu9GTb0uIOJJ9
	bEU2gRINvv+hdoOH8XQdV7VMf3lMZZri8nftO4b+gKBvOLjePERv6dXBMHNNtaXfvoY2Ht/GXwA
	tdJ4m6g==
X-Gm-Gg: ASbGnctC/0KIE5rA6OU5znaAE2VhsNNm0L+HUmXulTXjUuY2dfqgPnQM15shs1mLd6V
	mAVbA/iAQSUeub8lbyCFb/6zXIZ5KKugFyiy79+ZquLDX1D4HBx+QigtCLoo7IuN8lpRUg2FyZi
	6yJUf/UXNpSmuoDLJvt0tUVVNRZSK+xq0Ot/c60z/vhT0hXNz+seAOfhReWfsXyXyUjUvuXlHpf
	gJLzT+xNKWt5c60nTA4SofS5F+t7xIAe5T/vcN0Snzst9wg6ZgI5CFAjNxHLdZaBrNTmVlxpkNl
	ivrbg6GIno1xxuSJlxzj50lZ1aPiVwKG4PX++YhWZRScKJOwCfQRqQ==
X-Google-Smtp-Source: AGHT+IE2D/VJp57Hxl9axDzo6oJNvumHjtvBrJ+oZN2PEHsYJkVXPJxJR8fnVya7s6LHOzxTsDuPTw==
X-Received: by 2002:a17:903:40ce:b0:224:2717:7993 with SMTP id d9443c01a7336-225e0b0ed1dmr230864945ad.45.1742311667265;
        Tue, 18 Mar 2025 08:27:47 -0700 (PDT)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6ba6913sm95848435ad.142.2025.03.18.08.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Mar 2025 08:27:46 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@kernel.org
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL] ARM: OMAP1: defconfig updates for v6.15
In-Reply-To: <7hcyefqzt2.fsf@baylibre.com>
References: <7hcyefqzt2.fsf@baylibre.com>
Date: Tue, 18 Mar 2025 08:27:46 -0700
Message-ID: <7h4izqqryl.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Hi Arnd,

Kevin Hilman <khilman@baylibre.com> writes:

> The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:
>
>   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v6.15/soc-signed
>
> for you to fetch changes up to c2a5f8c4f28ffea8c93d10e509c5a6e61172cdca:
>
>   ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP (2025-02-05 16:31:37 -0800)
>
> ----------------------------------------------------------------
> ARM: OMAP1: defconfig updates for v6.15
>
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP

I see now this one was already included in the arm/fixes branch of the
soc tree, so you can igore this PR.

Kevin
