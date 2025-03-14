Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38AB1ACED3
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 23:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741995892; cv=none; b=G2Am+DeEO8Ubr5oU8XnIIOJ5u+8a3SfZkRa8bXBT9q2vBPbnfGbdh23wVcTkvdNeRVsl0haOkvsp4oTMTTjEOxLZ2DVGIrQhl6PMPMFRYL1FhGDfPAbUpQcpjIvVF6Zoxgs2mIllrf7jMXxU9eti04CGfIw2E5A2YYzgZD7QzNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741995892; c=relaxed/simple;
	bh=wF+lsQ7mJEHmcAoxF0flsvm5gnamzI2adupFAmV8+HQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Iht0gFVkjJZkjdeO0qO4klvh32PhijcSHUoNyx8SYPsjQb8jzoLjqWS5ES1qJlDs9GVjYOKoHEtG/HKCXxgY55470EqB8BAWTyMp/GF7AlQ0FWGCQsmj2afBsUeJENktpOI6MZmhHn+YE1gu40tt/ji0QVh10JlQoxm+pMVspEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3eENcij; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3eENcij"
Received: by smtp.kernel.org (Postfix)
	id 84FF9C4CEEB; Fri, 14 Mar 2025 23:44:51 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 97E82C4CEE3;
	Fri, 14 Mar 2025 23:44:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 97E82C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6df83fd01cbso12699466d6.2;
        Fri, 14 Mar 2025 16:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741995889; x=1742600689; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+vjrDVi1XuD8YezTfvAJnDkQnfPVZJ0QiIFwJDMUcMU=;
        b=Q3eENcijvAIAD8cFRUm79rJVB+2OP5/b2cj2kFieRkNJarzmX+h+lFT0fOSAGn5Rx6
         1LJNahquB0o7De88DtXMHVTJoO9CWDIOABUByag+Qc3sfbPiQbmBkah6KEJIjmSmBO9g
         nD8TKu3gsaGyDh4DHclStAeDW8xwDSe3YR/Q/gIi4Xmdjn3trNAjk9Io1NQniaya30rY
         nlEKvk4CuNpMyX3DlYJNobJ8dQV5ycE4it7ZoNydjmLjJ4YhocyGG1wMfTBl8s+8WwJ5
         ynN8cRqf31J6dO6SyWzdeVneEuthEwfjQXYwdLzWFbHHhzuu+FlT1DVzX7CAPEp5bCSs
         l1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741995889; x=1742600689;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vjrDVi1XuD8YezTfvAJnDkQnfPVZJ0QiIFwJDMUcMU=;
        b=Xgh/y1I02L7FuhPnJ5YtiEm1MQl0JMIlkdg2yrbmLZe8yzOJj3PWLh5jNeDW+wqxEe
         ljjl+2FF629od39igwWxZaLr2fn+2BChFzlw9JP6KpE56vuVW43NOLk3QlD5b9l4PRvv
         m4rSxkoiS1/AJ7VinmVLGvgWf1TcZo5VpUyDHavFcttgmuhwhxSyaMBphMKA2Fwi9NxD
         uMZQfgHqAyG+p5P9UHY6BgWcom9ltUyt38pWHH4/c3S/JbC4BQF8qB0hfEKRhQgQP7cH
         CumoFwBR2SZo4sJrNCClyD66wvLxJVYlqApdz0k6mIQb/d5It+Jy6TKCz3BzymPMgqDM
         Rk9g==
X-Forwarded-Encrypted: i=1; AJvYcCXrLhlNJ5+LAT4siXeAk9FBLQR9yfEUmGZ0CPwiVQHma/fW/l8RFq+dU6l6aawed1vVV1K3@kernel.org, AJvYcCXuWK7gwIXJE/I6JsENW2nW5AVwJKTRm9zjfIMqlKDibAt4p1P93UOefqRotyhN3ybn847KBQ==@kernel.org
X-Gm-Message-State: AOJu0YxpVciL96eaR0M1eIRm9amz5LhC6Nv51a4w01t1W0GlSJ4Frk0p
	Pup6qy5oyDjgkcngOZKzIa/wpHwm5zFE6LhMGWjkVbonZ1OftaCv
X-Gm-Gg: ASbGncthUQ1JtQDSsQ2jg48sRwM8XPb8HGmP4eRMsDh0LZThthNmeZlMnUuD9Eal5aO
	m+1BP83FLB/TBpJBlmWJmkALaZDZHzqw88XYOXnfuCIsoJ3GPzlNs4GXS11H95rNMwJlhHBBFHf
	kj/b7GUgcFW4OBD88BrPuIetbqjJPi+6irGh5wXX6k2jMF4flTDCCUtrgz3PXfq6NA5a6WmrZDG
	Y6CX8pvUa89g+KEfXNUIxZY8zhnnSTv7gZUKTghISfxqWT17E2apaePUW3tEto8g0YLKFuaZQTd
	cFYi3HO+AoANYlty0d2a
X-Google-Smtp-Source: AGHT+IHRUH+t/ZNriz9AIIFDUvNwqNXSWGPqwO6hLy2CrfDloRoUEfYKSMvcUddQ0QqLGeQiqSDYOw==
X-Received: by 2002:ad4:5946:0:b0:6e8:fe60:fdeb with SMTP id 6a1803df08f44-6eaeaa08163mr56420036d6.17.1741995889275;
        Fri, 14 Mar 2025 16:44:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6eade254502sm29566866d6.59.2025.03.14.16.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:44:48 -0700 (PDT)
Date: Sat, 15 Mar 2025 07:44:37 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org, Conor Dooley <conor@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Message-ID: <ilkznijefh5haqed3hpj5mynqiqoqvmzodes6os2cccy3tdxf7@zvv3o7k2eful>
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
 <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
 <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
 <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>

On Sat, Mar 15, 2025 at 12:42:12AM +0100, Linus Walleij wrote:
> On Sat, Mar 15, 2025 at 12:20 AM Inochi Amaoto <inochiama@gmail.com> wrote:
> 
> > I guess this means we should checkout the binding patch in Linus's tree
> > and merge it without other driver patch? Or just take the binding patch
> > from the patch serie and let the git ignore the same thing?
> 
> Either way works, it will not have the same hash so it will appear twice
> in the history but it will be textually identical and git will sort it out.
> 

Cool, we will have a try, and send a new PR if everything is 
fine. Thanks.

Regards,
Inochi
