Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C671A1E50B
	for <soc@lists.linux.dev>; Fri, 20 Sep 2024 12:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726836029; cv=none; b=aVLFMj6nWpbw6R65dOFc+3emhwgmFdfCY0VTzV0ZccWrKFe7IMcMuJrEhKPbm5ra0wmk3GkRmb7UKTvjcyd0MNklnt2rOad/PDJio5fFKlFNp9EnK9ZTGBuUt3GIUKDID8QkDgVjReh5eAziKZyxD9hRwyaZuYaQh7jFPFpXKyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726836029; c=relaxed/simple;
	bh=q4/BIqY4njqvHVv2+iuLTLDB8guMw7qRfA1PrzlgKb8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TGXMTob6doxobxCnDtzgi0/OzAU9MY1oddaJx9uNV6GRp9NtzloKPfuc/KTySlrzTRHwlht0k6AA+fTOu8cnkWR67g9PA2NR8t21CxIdEYu3bpb8pnLeseWglYvEzLqsKYDKxNZIHCBvjvEJ3pjJqIjf7bA5v7LuAHE6yFw4MGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=Cw/tW8q+; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="Cw/tW8q+"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7aa086b077so271372166b.0
        for <soc@lists.linux.dev>; Fri, 20 Sep 2024 05:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1726836024; x=1727440824; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AiKowJe0HbnPow5P8xWO2DJd/woQKyyq0ClUMSBtZrU=;
        b=Cw/tW8q+9XcG0JTzoLiKXf++CQ9EPY6ac3jzyW3iaZgmpoFtaqp9eWdO2e5QRwc4Z4
         Qki5Saf4qsG04dY+LhRuJchw14iC5hdoNG4ECfpStL28XOk4NsHImVqAdF3Ht+iLXgm2
         6HO5u3JfCImod63XYkEElk+nGdGp0FyiqGuIN4buRQfHA/xViihG7EDbsVrOdw6kv16h
         xs96LVx/Aak7N32/nTu4gjhauqBKgA7j3O7d+cBeBt757jzgpsQdTYqb+Ym38MQExYdB
         ZNH8FVblIsWWXypwz5cNir4bjOE2aYKl91zl/yIZBb0La8sRJSWHUiEBc3dSJAIHmWog
         8J0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726836024; x=1727440824;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AiKowJe0HbnPow5P8xWO2DJd/woQKyyq0ClUMSBtZrU=;
        b=PlSJgMV+X2CykSuL9ooz8l3lns5T/AWXakTvOalKigZNkFC+aJnn4LU5PqV9/1KKP6
         yIndgb1/VVbiuHksu/D0HKpFqtpwUvItoEqOj7h1ge9zujzejMFkdH4ltBcBPbc944ss
         2r969zMSM9+a4ERSiAc58uJRgcHw8RKqJwRSr2j9KEYCFCz0wr2IKeHUARsUxXSsEcA2
         EL7ASbyfKKiQWMo9GXhQCtm/WgCDPPZFUH662ARvGBBdd71kREV6yEwOcer/bNn8p6V7
         G/lto1kMOecDhrcAOMj+S9NsWS38q/ZKU1QiXWPHkesLc7VJRgUbchaFk/BHoFMRCuw6
         4I3w==
X-Forwarded-Encrypted: i=1; AJvYcCU9mCwinWPzh2DW77WalecinSoTqo6jFNGqcfZsGl/7/liiVoY8EOOAadJlKJym438Glgs=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywzm5xP7IkwJWV6orTaRx7CO5iMg2kZeOlBcIrSntfnNZwlNyIj
	KMa1I2Yery3bUTAKeGuZgN7zRT9LPG/yi51ImvJTjmXU4L8NP6D6l819n/zyU/w=
X-Google-Smtp-Source: AGHT+IE81ecvGa811EkXoyxww1gN9FJ7ZQtA+4G8+0JY+jFcluigqv32wSHx83rVVcOb2/GjOEiFpg==
X-Received: by 2002:a17:907:3f9f:b0:a8d:4631:83a9 with SMTP id a640c23a62f3a-a90d4fdf292mr246651966b.3.1726836023713;
        Fri, 20 Sep 2024 05:40:23 -0700 (PDT)
Received: from [10.241.208.32] ([193.32.29.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90613303b4sm838990666b.213.2024.09.20.05.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2024 05:40:22 -0700 (PDT)
Message-ID: <05c413ac-c020-4270-86b5-de407d878cd6@kernel.dk>
Date: Fri, 20 Sep 2024 06:40:21 -0600
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] MAINTAINERS: fix PKTCDVD DRIVER to use L: for the
 list address
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 torvalds@linux-foundation.org
Cc: linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 soc@lists.linux.dev
References: <20240920-maintainers-m-to-l-tweak-v1-0-ea80b5cd3420@linuxfoundation.org>
 <20240920-maintainers-m-to-l-tweak-v1-1-ea80b5cd3420@linuxfoundation.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20240920-maintainers-m-to-l-tweak-v1-1-ea80b5cd3420@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/20/24 5:03 AM, Konstantin Ryabitsev wrote:
> The PKTCDVD DRIVER subsystem has an M: entry that points at the
> linux-block mailing list. It is perfectly valid to have no M: entry for
> an orphaned subsystem, so change M: to L: so it properly indicates that
> the address is a mailing list, not a person.

In lieu of finally being able to delete this ancient thing, this looks
fine :-)

Acked-by: Jens Axboe <axboe@kernel.dk>

-- 
Jens Axboe
