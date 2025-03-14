Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8216C17BA1
	for <soc@lists.linux.dev>; Fri, 14 Mar 2025 23:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741994447; cv=none; b=m0/Dv4c9I5scwSKTyIHys1V/Vlkt5k4xLtnNjBeuyhEPwPKuN2v81ESz2xSqp9DCAEA6AsEDM+4R44EkETBpL7ooL6hATVWYs5adD5JgTQutHPf1ulr2WRcx7FDlQEtPd7olIwecG5F8lg/9NSX9P3kSP8oPJ5GBp9PUTyGECBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741994447; c=relaxed/simple;
	bh=GFPjXPYRlnQIhbr6md5LV8bTp3Z/zVq4lK7qcEWXtPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fys/zH/d71BbYlgiZlScUtJIulPXK0uFkOPF7+Y6vlMuDgvGkYjMldlS3tC6sRf9p76D9KF9VN/vbkqei3EybDyFZUcQ4lPqJFwFPTtBkTnVUktmTwyNPG3u8brWX60UkkH4gK1UpcCWcoNjqMKtHS/IqYS9neZ2BrLnRUNkke0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDichr5c; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDichr5c"
Received: by smtp.kernel.org (Postfix)
	id 14D03C4CEEB; Fri, 14 Mar 2025 23:20:46 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2DE45C4CEE3;
	Fri, 14 Mar 2025 23:20:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 2DE45C4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7be8f28172dso177143485a.3;
        Fri, 14 Mar 2025 16:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741994444; x=1742599244; darn=kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iPHaV1z4NWkaWgSXlughOQ6tIsariGFIoAHIEq5GJrg=;
        b=YDichr5cplmfAiTtoh0ygVd4Uqd1+NRiUQlk1ovS3urwCNCZVojr7EkoWBvSJkFD/N
         zCe+qPvWaRpk4yDntjDC5zAKmfAU8xpvMnAAtJy1HVcxA8YpYe/NzeqHQoqI7RNZPqmt
         7ohks29FPVh2VwXAmkyp1+FFzmMRDjx+zLfjmbvENaUa749xFrL+StNPrRCEDT2BKrB1
         Dxjix9tiZVNZmpvV6V7ediR6HKYNLQMZFRnODpCIknRIF47UInEMzkLzZS5b05BOCww9
         m72/0tGPDrG+XJ3a4BDHPsU0EZHravul0ysAU+mitEQkNl49bc9OaL+0CIpp9fG3qpIy
         Nsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741994444; x=1742599244;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iPHaV1z4NWkaWgSXlughOQ6tIsariGFIoAHIEq5GJrg=;
        b=Si8DxTDbc4NN+Tot/snH0MG88VxqUGtyxX37E/EDq5AqZg5ifks5rkbZueBv76/oxw
         ZsX3CHwndx9qkQyd2VI/2erXz0SoS6tkz3JJU3IQv8DCtb/bnNzOyMRHO06hJiVjD8q+
         1SXOyWDW71ERNXcwMTLFteP3QGJVwJQgZsqKQ5IDN0L63ocoybJICOhCQrHiAQPvhr8c
         ji0IfqcBTYiWyUmIhH8AXs1C/fenoIfVhUMn5KwlE0avW8fAtN2mDpNfhbUmVrqlozUg
         yi6r6JC1/JRcdh1gYFSn/1a+yCnl2AXSb+6CQcN7ax+dTm/9F4P0qwHtScmaSJFTTqCq
         HL5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXSlaLUfBCcj6oKnmVGg202MDgVZhgiEPRDA+vx32+/LqueHJujsFEUS3wYBW7wod62iTzfA==@kernel.org, AJvYcCXiMi4I+fnd38ZstjT6zOs4pgpSKVKcg0VMRMv7qDAiheZPydsp4XmepV7Q51S35LMsO95N@kernel.org
X-Gm-Message-State: AOJu0YwsW/DZtQrM6kIEI8tfHmY8mTjKAquv7yUIt5HFpaScXxPJUj75
	T9qSeM7E2afRD5JRF/+tkaXxti5P0dPBvpkuX5EFiHWd4KVUVuKu
X-Gm-Gg: ASbGncv9BwEhlSR3sLULcSKBqkcZgqbTMLPXdJ2agFHbzlBLLRgzVSPe+ToQP5kW5Jd
	7wJB1pk/s/4YEiWIYI8aknOqfIyUeB/D0wPLF6EDu9SvOZr17R0Rc1gtjkUaq5NzHc/pTIOfOzF
	zKQZ0lM5eL9sHpYi1iC6s33OCx7C76kVm4x+GQtFY/VZ4t50T1LoCP5uS1024BETgc4tm4QbaeH
	ghpK8013o/cKIYWLdjyXw8IYv9IUunltqDUY1m1EF/vIyMjuCaWqiMvu4FgW/B4APUePbNYa5wc
	h7nGxH7XcrZYO0BN59Me
X-Google-Smtp-Source: AGHT+IFj/SlB1MFhDPin66L0iQfr4wDOGbR6n7uiOtlKhc0AhLhsMg5/g8AnbxdPUUK4+Mj4P4Bj8w==
X-Received: by 2002:a05:620a:1b96:b0:7c3:d75c:cc45 with SMTP id af79cd13be357-7c57c8ab6b3mr658626085a.37.1741994444057;
        Fri, 14 Mar 2025 16:20:44 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c573d9253asm310153485a.104.2025.03.14.16.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 16:20:43 -0700 (PDT)
Date: Sat, 15 Mar 2025 07:20:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Chen Wang <unicorn_wang@outlook.com>, soc@kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Inochi Amaoto <inochiama@gmail.com>, Xiaoguang Xing <xiaoguang.xing@sophgo.com>, 
	Chao Wei <chao.wei@sophgo.com>, sophgo@lists.linux.dev
Subject: Re: [GIT PULL] RISC-V Sophgo Devicetrees for v6.15
Message-ID: <t5p5mssjmpbkwc3myfjnolzt23vo63px7zehsvwfp62mdrz7oi@qcrt3672ghxz>
References: <PN0PR01MB1039398834809EEFB83AD25F5FED12@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
 <f65bba9b-726e-469a-8657-693bb640d75b@app.fastmail.com>
 <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdb+U7CBMByZeYmNedv8jEhNXn_w3psJSfRi62diOBhGCg@mail.gmail.com>

On Sat, Mar 15, 2025 at 12:06:44AM +0100, Linus Walleij wrote:
> On Fri, Mar 14, 2025 at 11:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > Are you actually doing incompatible changes here, or is this
> > just about the DT binding?
> 
> If it's just the binding I guess we could do that stunt where we
> apply the same patch independently to both trees and let git
> sort it out.
> 
> Subject "dt-bindings: pinctrl: Add pinctrl for Sophgo SG2042 series SoC"
> 

Yeah, we only need the first binding patch to provide binding headers.

> Sadly it's not the first patch in the series so you can't pull just that
> from my tree.
> 

I guess this means we should checkout the binding patch in Linus's tree
and merge it without other driver patch? Or just take the binding patch
from the patch serie and let the git ignore the same thing?

Regards,
Inochi
