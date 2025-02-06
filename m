Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCC613B5B6
	for <soc@lists.linux.dev>; Thu,  6 Feb 2025 03:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738811066; cv=none; b=cLNTv0ejhMfoU2LvE7DTQ+fEnGqkQ4yxz5oMvT+AHViNibjy60csF6ggak9LLvrQmIOFN8NiQHyev81/F2wjNKSqkuEI22OKPYCBjFiwU/AvSitd/tab2GkP5sniHPG0XaiYZ+kT9S88vVCEcSSrozI8KfhH3TZoWM4Z7qiEuGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738811066; c=relaxed/simple;
	bh=bMNaySAiVfKEoMfLWjDwwedVnyphy/yHvzElicLmEuw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cV+Bgl3FmbHAKmaoFUjTlZNw/UCsxeeTmd8oZ6SJBnYAtB92LbSqLiiCnDMQPclPqawjkM6Wa8ZCW970J35vt3fTI9kRZbA7uTNV1lb9nE4LcgRwN0st8+g/soAeOsNqYvfeCr1UTjvBi10GUpY6yfSmhz26TNXvamk/mCQxLh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au; spf=pass smtp.mailfrom=gmail.com; dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b=kicdFgjn; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="kicdFgjn"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ab771575040so55347466b.1
        for <soc@lists.linux.dev>; Wed, 05 Feb 2025 19:04:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1738811063; x=1739415863; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kHXeN8LIM9w54fK8BX5YrWdpuop7tLiyGoSgZk7eNoc=;
        b=kicdFgjnmgow+bprW5hqFzBaXoCU15u2zUaNSTgjnrcDPyXey9pdDW1+CJrr5h0jbS
         ZAekPQxoWMjAHdm5c+V6bSMrMJgncLHHJsEIqoiH19ABIhLg/1Rift3wC7kQH/OlVu5y
         GVrmKhBabKumppY3Py1k9YY7sQtiVn9WHbW8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738811063; x=1739415863;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kHXeN8LIM9w54fK8BX5YrWdpuop7tLiyGoSgZk7eNoc=;
        b=vueLfbJksC1OLJhWFbSznJ9gizdMCoVxR+hvcK+lhVqiM7mvFfiKCjsqUasMg1wJhH
         HYxRgvna2+ddJOgg6yiMGeJxfoUhJPet2FhLfjcR2GAA+GC3u7cPNYCfoTddcyuTwAzl
         zqmZhj/dr/1m1Do07Lgll9rcoobw4xlJH4KACxLgbE61WfUm+e2rWNdkhba3bYi2S8vv
         rRNVfKLQi/IRIWRvMaAClDI2TE2s384SsUaiQOhi4CE3TOhmjw9ALJtlldDtArDbY0W4
         ZQDr8cnAOitK6bzAFar5Vglndrxm15qyPu+huLpWJQKsWwhH7ZnHSbE++UGzQfOOyCIF
         P5qQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3AiH2IH7xzJmCqcwnHDrr5UFpBykcWjHC6KV4/ussM2AAdcVcX6NeiFLPHauUyntHmJg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyqQHgZZd4ULVWkG97FQKxO1yXCc8D4+iX1atZuAzkPr5JmepOT
	0RztVYsV47kWPu0yx+SuXWSHATlGkS/pr6N8n0bmY3Q9b6jbAGiDtXuJG+gqdpRuw5hJpPsvVZK
	sAQisuqlMMboLVw9ELxo3MK7zjeU=
X-Gm-Gg: ASbGncslDbTqYL68RNGpmSZm6T5dswZdn5/ehhS8oJIYonZBOiPJXl2/otVSFaULhOI
	gR6E6kdQW8DhFs92odqhCJ55mzghH+3sCI8Kz0yN/dOWb5lXfLSsHXWP2s6vQAjgq4lSr74jI
X-Google-Smtp-Source: AGHT+IHqxAD/mAroNe/du82YKfNv9KCYjKV/xBzj38++g3h5xV+O074K8SXXeCFqLMo6ZY+71Vf5+TGBbTDseAZx9Xc=
X-Received: by 2002:a17:907:72c1:b0:ab6:d575:3c4a with SMTP id
 a640c23a62f3a-ab76e878417mr125480566b.9.1738811063095; Wed, 05 Feb 2025
 19:04:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
In-Reply-To: <20250203-aspeed-maintainer-v1-1-60bc3a5f0a7c@codeconstruct.com.au>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 6 Feb 2025 13:34:10 +1030
X-Gm-Features: AWEUYZnF0CfsV_4ImWi4JVAR627wkvGoxLYm6rTH2Jjlr9IDQ3zsK4d4k_9LZjU
Message-ID: <CACPK8Xe_3t0n=BDcbFQLt+M1K-PTHMWGs37k=4B9P6tfsqEXeQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Mark Andrew as M: for ASPEED MACHINE SUPPORT
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: linux-aspeed@lists.ozlabs.org, arnd@arndb.de, soc@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 3 Feb 2025 at 13:27, Andrew Jeffery <andrew@codeconstruct.com.au> wrote:
>
> From discussion in [1] and in-person with Joel, flip my entry from R:
> to M:.

I'm off the hook!

Acked-by: Joel Stanley <joel@jms.id.au>

>
> Link: https://lore.kernel.org/all/CACPK8Xe8yZLXzEQPp=1D2f0TsKA7hBZG=pHHW6U51FMpp_BiRQ@mail.gmail.com/ [1]
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: soc@lists.linux.dev
> Cc: linux-aspeed@lists.ozlabs.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 896a307fa06545e2861abe46ea7029f9b4d3628e..305e5530560e53c10f0b610fa7b4456ca78fdfc2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2285,7 +2285,7 @@ F:        drivers/irqchip/irq-aspeed-i2c-ic.c
>
>  ARM/ASPEED MACHINE SUPPORT
>  M:     Joel Stanley <joel@jms.id.au>
> -R:     Andrew Jeffery <andrew@codeconstruct.com.au>
> +M:     Andrew Jeffery <andrew@codeconstruct.com.au>
>  L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  L:     linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
>  S:     Supported
>
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250203-aspeed-maintainer-dddbbe22da46
>
> Best regards,
> --
> Andrew Jeffery <andrew@codeconstruct.com.au>
>
>
