Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2E64C8E
	for <soc@lists.linux.dev>; Sat, 15 Mar 2025 00:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741999832; cv=none; b=GaOrXJ6zBDmYITo9Pc+b5m6IhNnGY/wO+a4H+jRMUGvLXy2HvZ8GRMpJc1OozmOOvvw+SCGv1l374YGLYADSp3l8FUgWuPASMhR+mzc4p5yjfO5BanTOKV+M46PEMwt7HKwrg2CTnPeqKwU4FFUHW5nFrw687Nv6t9NE1OFjKQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741999832; c=relaxed/simple;
	bh=4ZHzDpFNmj0jXgDXu0digMqc5RDfhYEUTy3AxzDTkBs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D9dJpC+pTA3uho5gP5EKeaLlaDSejy5TOVn/l+TDFSvC0y9nmet/xVeaEBWbbkCGBiivboTuQTeRNBs+e7PEuz5PlNGhtf5NiCti5vAdcUR/Bo4YfhQwE3eXlbTrj1CBBFTUX4nIt9Xhwo/bJqD/FP6SGukHjdwjJG3ccD0o4ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLt5Cqxy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLt5Cqxy"
Received: by smtp.kernel.org (Postfix)
	id 7FE63C4CEEC; Sat, 15 Mar 2025 00:50:31 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9C852C4CEE3;
	Sat, 15 Mar 2025 00:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9C852C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476af5479feso27067241cf.2;
        Fri, 14 Mar 2025 17:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741999829; x=1742604629; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XL0DMg+SaimZCHhr18HPXkZgkXm2yI2aAJewslZgM2o=;
        b=aLt5Cqxy8OZmgSs5l0thWBjD0mV11uD9VCqhVF+UKyD6qwGoXxycXYD7enVY43zhRj
         1jRo4pHH9GvhJJU52kxnzmQAyngE4zTI6GCgx0ur1VjwRQMMGUavgHCzXy8XBtAXqslo
         CeF5rntGNSaYFZe9/+uj+c3QxUOLxenwB3kgKTcZjHw+BVTizDEA1UroMxhkZjjk0oEv
         peoBi6HLqc5DgOj/dx1fhpFjgNCliKfqFpXC1G8JBanrVmRZkPpz8D4ibdUDdNNH0QDC
         rPwpVZ3o5ZrPV31SV2xL3Jl097DwBOK83M9scSlg81caeckhT2A3bbRVeBK1YoIvcrps
         +TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741999829; x=1742604629;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XL0DMg+SaimZCHhr18HPXkZgkXm2yI2aAJewslZgM2o=;
        b=pQx5OsmLjeRhX0/q99UFnj7D5n7IbZhnqkM0lVBJtJn/1Ef78U6/6AlhlTqzphZE9k
         LS2YPwBI8jekfQjqDSQEZq8VaUMdiQKWdJDobfV5JUGp63X1TfgCLkXWwBLLS3O5TMKF
         glkepn0JM/MrjAN/F/m7z1Fu4YYUhA3EsOjuBe2Afxzn6qRuyq+Ao9Su0hMhmwHseOGe
         XSz1IpyHIiyiqYzI0izHZrqGRjysECiqMa5aFGXW2/H7LvTiAbLzCeNHFBO0p3DXvOGA
         f62QJRN7LuuXpbqpXRR/XBNALL3Arfsy5KhkBtdp72QAYjEz16cYfBfyBzd+YtjvugSM
         hTEA==
X-Forwarded-Encrypted: i=1; AJvYcCUsR9uMc8zhHgT2NOsfcuRkgccErdGJoVV97yEnlpKVhRbDdp6ipjwQLAN5A1rdrYbTnH3j@kernel.org, AJvYcCWtTolKvlMA7fqQqClMnPEOm1MpmOh9/CSKwc5PqJMd3n6mm6vvHuRpZx0CvaP9iF45Mf9dJQ==@kernel.org
X-Gm-Message-State: AOJu0YyANI1xGLGhiUabW9fOE5SwGDDpNdM/BVPqTMuW8lyDMIQNZDWS
	JzG+Y/6S1lNYIR69O4XykS5eoS7p+PHgoDLGL99dWK27Q2NXjl3s
X-Gm-Gg: ASbGncvUO8Rw+tk/PG5EpgWWjTA6BVUyMjpXPnIW+syLVYT/Z8I43hf9iehGclOa+vK
	SH/R9OPOCYnptuBkKKXCTz14aX6dtxSFuvLD0KThsd8btbIUYUuhx+P4bvV/PiwfgFs7Yru/5Ta
	o3Qjk0/Hg7sJegGpycX23CYc22kviIadCr2qiQL2dxdt/04vsBS/8fn6wAC7h2Kl78LQON877vO
	jM8cjmaeDPnRP6bei9wqDpC5xyFk5avEueHIx151x/QNX2FfoRdRbIyREvtEcsfGhK8p5/LQLx2
	yOrL2b6LwnMil6lom1gS
X-Google-Smtp-Source: AGHT+IFvQ9bf7j0bsVydFqN+0fJ+kH39Oh2c16QC7usKjIe+mizhREpZmPxq1sQHO0ujeh7++0yTiA==
X-Received: by 2002:a05:622a:354:b0:476:9847:7c6e with SMTP id d75a77b69052e-476c814a7aamr67976661cf.19.1741999829372;
        Fri, 14 Mar 2025 17:50:29 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-476bb60aac8sm29093511cf.15.2025.03.14.17.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 17:50:28 -0700 (PDT)
Date: Sat, 15 Mar 2025 08:50:12 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Chen Wang <unicorn_wang@outlook.com>, 
	soc@kernel.org, Conor Dooley <conor@kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Message-ID: <futjsg55afhxz5whuve4qgnicdupedz4qgqbeox2pp6s5p4tfi@h6ueigflfs4m>
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
 <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
 <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
 <CACRpkdarxLiyfZJisyW3F_ipiOgOP189iqUkeGtuKKttHp8F1w@mail.gmail.com>
 <ilkznijefh5haqed3hpj5mynqiqoqvmzodes6os2cccy3tdxf7@zvv3o7k2eful>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ilkznijefh5haqed3hpj5mynqiqoqvmzodes6os2cccy3tdxf7@zvv3o7k2eful>

On Sat, Mar 15, 2025 at 07:44:37AM +0800, Inochi Amaoto wrote:
> On Sat, Mar 15, 2025 at 12:42:12AM +0100, Linus Walleij wrote:
> > On Sat, Mar 15, 2025 at 12:20 AM Inochi Amaoto <inochiama@gmail.com> wrote:
> > 
> > > I guess this means we should checkout the binding patch in Linus's tree
> > > and merge it without other driver patch? Or just take the binding patch
> > > from the patch serie and let the git ignore the same thing?
> > 
> > Either way works, it will not have the same hash so it will appear twice
> > in the history but it will be textually identical and git will sort it out.
> > 
> 
> Cool, we will have a try, and send a new PR if everything is 
> fine. Thanks.
> 

It looks like there always is a duplicate commit, I think it will be
better to hold this patch and submit it in the next cycle. Anyway,
thanks for your suggestion.

Regards,
Inochi
