Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794843944;
	b=iiVEhuqfdtp18/VjYM18eo79wJ7yUbzPf72/6NT6qD3/Eu9mUF2irpESt+/fVUtF5zNu
	 HLmXuSfJSAr8aJ/tSUoc0gq2RzFmweWZvC5FW3A9RPkvtjVULlLagSspXa7vZgalpUMrB
	 BgjLflB14YTsDAphz+RkOMORV23nT+ZM4EVMXasPmjT4XVUEnyUTcnahDuU2hWz9yX9Ct
	 RtnoXqAoosFsAoDlTmp9Nowfzwg2ars/iyxoHUHeGhOWq4Ntb68yYhHsMRThD1Z3MlYvr
	 X1GVkWason4ZcPjmp5M3BrecGIvcdekmAvGbMTYctmbSbRUWZwItX/6zG8FMm97NqZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794843944;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:In-Reply-To:User-Agent:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:Content-Type:
	 Content-Disposition;
	bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
	b=eHu/hBecUwSwOqp1WcAvaoRDpplhM+K/bd4YX/tIE2biLQf8wF51oY90CJLgbUHkSShr
	 7Z9izUpGfOh0ZlRZ61+Xa7LIdX6WuTsAN5u9+WTVa5T9ZhVvy9jQMLgqEAz7C9YFNDWUU
	 wEj7RNQPhP1/mEMLzJDjePEpzGKf1WLPIZeIleQN5/nNoIjQXBIFL71f4Fs/XeMyGgzWS
	 LX3CGmuQIktTVp7+VtchI+cwrxzfH/U0USPNhn0gLRco1oHFrYhkk76c0Uhhe17hb+6M5
	 D1L/VWF0amSXpZm9ozmxgIJoUCTVZzSMr29xVognCoR0luEWUoIBXizcWTHrbAxPG5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dj9FE5Ke;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB171606A880
	for <soc@lists.linux.dev>; Mon, 16 Nov 2026 15:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB171606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Dj9FE5Ke
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794843943;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
	b=Dj9FE5KedxW0IF/nQT/h8NCoTTteH0GzC8kWon+duGFaxAHI5UPvqjuiiwzJLL3B718d5U
	zIpHU98gm/bDf0nHhvSgGcb8C/ppgOK9dlFvOusbQRxHaLpNIHiE40JCi+qfvvqaDeaCbv
	x1vxKxqcowOD2xxbeTRonnTFujs4gts=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-3We4oY_ENkOWcOs-n0Bszw-1; Mon, 16 Nov 2026 10:45:42 -0500
X-MC-Unique: 3We4oY_ENkOWcOs-n0Bszw-1
X-Mimecast-MFC-AGG-ID: 3We4oY_ENkOWcOs-n0Bszw_1794843941
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-944138ed63fso554703485a.3
        for <soc@lists.linux.dev>; Mon, 16 Nov 2026 07:45:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794843941; x=1795448741;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=01d72rU72jpJUH9kDy6vqeWai86JF2Ta6ELfzrX1GeI=;
        b=fAqyRTRYLgZSXrxrmcc4bFJxwxEdsV1d7EAlxkMJ+wGmZYyrfzGpx1nvvoMXcf2FBk
         jjp+U9fJr9qVw2YktJsjYekv3LvzzyJRmBMEWrD9vXh2M+Xf6+4fht+q8afaM+khwA9C
         4E2s7LTIHLH8HzuUm+zxnrvMYE9TBzT8bctOUqqyFo4QnvizEiOpD9BVgBGIMYdd15UV
         7FicxEetL4WLMmzt6KYTEoaOWy4SItHmxoPDM37BcSf1aMMGSD/s/d+/eor/ORJHLraJ
         6Lbbgupvrw1xqAS8VEEcNcaNH+GsxxDO8N7u8ip2Xu5oyIaJp9TKBwoyU/lQSeAEy1nI
         sEew==
X-Forwarded-Encrypted: i=1; AL+hErFEopEYzxBb1udsKM3pRU12Gmldfbsj+GWQkMna2DfAA9fZAU5NDvpW4n/rUHTkWguKprE=@lists.linux.dev
X-Gm-Message-State: APuU4Z/G8lnC1N1UzsWYDFd1lwdu3fpy3h3BEKJB+ZLV2Uo1K2q48PK3
	KMZLk7zHKQ8Ob13X+wuWn/2hWqT1w6iUFEnZGu4W9lpYYaapwRfFmH3+hwKt49AUediKiDrfFYD
	DY9iNfce0FvXhTbu/jmuNOx8ugC8vbIrwrOeApG7uLRqCQ4BF7eQCYg==
X-Gm-Gg: AYBFou2ibHldf7Wty9t7IO7Xan6CvV43GVaLlxy1MEX3cG7j+H1iYYAdmG5tboYRMAw
	bNGpm0X76g6wr/vsbmMoC8hKVw3qBeTT3/aPMMFhaf56ZtW8aLnCQZL7hGF2dpzf0SfU2/OxglI
	Rvy5qmgb+GdqKtmOI3GyqFhjtr4Hg+PSMhTUV8vX8gdtJB0HOoTBX9bkmtk9E0WGBwDyhzdLaM0
	fYR6hNInT4aaoUCeutnctEJWtvbMTBtnKwRF1NMY/S/ljdKWp2NUAFSPjXdB7Dv86FPkCql7+d8
	p2j1rZJAmelsoOHD6dq2GDORRYcTGuLrM9H3eczrQIozjFul5MNFVQ7HC+6iTCXA/f4tNnyV6VP
	nFTSYUW2GCJ3azv9uMtqDxDhCZtsKnauId2NasM/zXG1tLF4Aeh1ug/zW2O/GbrMg2StBg5psPd
	kcXzzZpSm+Kl+xjxHGwcJ8X99hMVTDasGri2OSBItp
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr1849380385a.17.1794843941206;
        Mon, 16 Nov 2026 07:45:41 -0800 (PST)
X-Received: by 2002:a05:620a:2805:b0:93f:1ed3:a9cc with SMTP id af79cd13be357-9494bbdd1e6mr1849341285a.17.1794843938440;
        Mon, 16 Nov 2026 07:45:38 -0800 (PST)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm877596085a.32.2026.11.16.07.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:45:37 -0800 (PST)
Date: Mon, 16 Nov 2026 10:45:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: zl020895 <zl020895@163.com>, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Brian Masney <masneyb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Subject: Re: Re: [PATCH v11 0/5] arm64: add Ambarella CV75 SoC support
Message-ID: <avslH10GRqkVT9fU@redhat.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <179427375370.1061670.4050288038934218487.b4-review@b4>
 <20261110-interesting-hilarious-shark-2dbfc0@quoll>
 <7eeaf54d-2d7d-420c-a34e-eebc6dd0effe@app.fastmail.com>
 <bbc16906-45e2-4d81-ae81-ad93e87b13be@kernel.org>
 <c67939c7-9725-459e-97dd-e104f3b14022@app.fastmail.com>
 <avMM8z-LYncKS8ip@x1g10>
 <avMmKJpczepWTRdc@ashevche-desk.local>
 <avReozTC_GEmfIxG@x1g10>
 <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <2b30e92.3c75.1a1e2828c3a.Coremail.zl020895@163.com>
User-Agent: Mutt/2.4.3 (2026-10-09)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: kufeanUYeSBK9zXpiSXtKwZiStF0uAx7tXZUT0PbAtw_1794843941
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Long (and Arnd/Krzysztof),

On Mon, Nov 16, 2026 at 11:59:28AM +0800, zl020895 wrote:
> At 2026-11-11 20:25:07, "Brian Masney" <masneyb@kernel.org> wrote:
> >So how about this:
> >
> >- Have Long post a new version that splits out the creation of the new
> >  Kconfig symbol ARCH_AMBARELLA into it's own patch. I assume Arnd could
> >  provide an ACK on this?
> >
> >- I create an immutable branch that contains that the two dt-binding
> >  patches, plus the ARCH_AMBARELLA Kconfig patch.
> 
> Just checking in -- there hasn't been further feedback from
> Arnd/Krzysztof on the plan yet.
> 
> Should I go ahead and prepare that split for v12, or hold
> off until Arnd/Krzysztof chime in?

I haven't heard back from Arnd/Krzysztof yet. How about wait 48 hours to
see if they respond, and if they don't respond within that timeframe,
then go ahead about post a v12 with the ARCH_AMBARELLA split out into
it's own patch. I think that's a good change to make anyways.

Brian

