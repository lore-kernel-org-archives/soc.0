Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C034C1ABEA2
	for <soc@lists.linux.dev>; Wed, 20 Nov 2024 23:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732144749; cv=none; b=UiDBkikRSHQDfTPFoAXA9IEjUEQZMB05iIQjb/mLRRt2PlLqTZ33ausKOTDgvib1mziijS0fDRxAV+D90c5FGFRhEQ0A+fLp3nnxqMOn+pfRAcGQOHGUGM1ZFYbnB/pLff7HZJxvlk0Mop0p1sJb2cGidQ2LULYR+6BCF7klJHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732144749; c=relaxed/simple;
	bh=OtDVQGltJXFsQr4TPz8WFmlB5hbU4Tq+iEJR2Zd+E8w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=He22Fm5sFletgtxQmSf2Sg351AWJBJUTDHX7z5NaKyH1FX+XEhM+IVUGha2l+4EY1Flgm9Hx6trN8hqulEZtob6CP8bt9a6E+VFnFfAFG747zrKIAILbQQRRBtbJq7QSH0StJ+AjMPh0CvuRukf8Hg+lVvje4oe0cvO0JlynXTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=CTlqA61h; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="CTlqA61h"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5ceca0ec4e7so300279a12.0
        for <soc@lists.linux.dev>; Wed, 20 Nov 2024 15:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732144746; x=1732749546; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs+SrsC9IUbgaKcIlQpBc93FEGDcRI3usKuzpnz5nwQ=;
        b=CTlqA61hVVBSX36plX4kaMNRkWMSmUIoyxoGdDwl52Lre1pkT73LKnF2CA+E6XhvWe
         p+2QDVSy/WhQkmY0fmVde+bgmej2/yGABNqPXgvoCxoy3flA7ujbOyQZs+hYUT98mHKt
         ZJvCoM8clayY/q/aRaLlGII+1Hak/XoSw1OmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732144746; x=1732749546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xs+SrsC9IUbgaKcIlQpBc93FEGDcRI3usKuzpnz5nwQ=;
        b=Ve7rXlYQy3LTIieOaXdFTKNWhJud1dicIIDng78iF27SbC9/kIxpkCHz0WD5CicUjE
         9405pSpD2p78MtoDVs/219dX5Wjv1MwzLoX68hzxC4Po+ZvFfrkOw8Caw2Xs+CrUqKJj
         CDgFuY6Q0yIB8y6Reu8u8nnn5/iOyEwHJGsfVDBbl4/A92iSJKpugq3NFQh65q0/eCgp
         EQ/iCXTyxckxYi2FXyZMGszdXt4ZV1NeN8G07PqNSnhkuflUhLaxZXpxO6DbXpCo1CY/
         9hBKDL0wqx+Nzx+ucv4n+/wrLh98dUmWtIzTa1Su95yWHJdIOm4YPiV4eOhIGZ8K5SCH
         5J6w==
X-Gm-Message-State: AOJu0YzLXre+52iF5MMKDxUErGvTXyhjbBIMgjZ2PpCyhOioL5I7FRqU
	U+J8Wzbh+pNV1VqyanESaa4yDUrdPOv8DdR/xiNZkX3Linpf6YJ37Wv9CjFtFHy0LQWkhR45+qf
	wjz8Kmg==
X-Gm-Gg: ASbGncsvR1w/N99LqjCsVnm1IHta0axGKe/mXDzl4EeMl8EbO7AS6FDAz+uLYPdrRfn
	jwFdVU/DhVFOFIG5q+FhUlMQb9GxLM6u8HR9OyiG3fwIu0yBLcPuNLgpIg0iyDnYAnJFocT/IkC
	eP+OLF5m96VQ4Y3iTljhJ/ItdGBa/aDoS2F8i0R4hscvC7evWq3aDdpiPFLn9KM80/FWyNRmKTH
	ZKfO082H1JpbBZJLncfovw4r64OENEzqCnXc/Wsb3fHj8iTbl6qNFj9PDqgwoSmq/i2++U8apC0
	dZMFbK+c0bYSTqVS4X0EMDV8
X-Google-Smtp-Source: AGHT+IE+0LDCTxTH+cWnvR8Hg8GQacjhzOC8RDYc/sZZx6/OigQzagUnrjhLzeIGU3RMP5n7D+eSKA==
X-Received: by 2002:a17:907:a08a:b0:a9e:6712:c27 with SMTP id a640c23a62f3a-aa4dd748bc0mr443219666b.49.1732144745981;
        Wed, 20 Nov 2024 15:19:05 -0800 (PST)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com. [209.85.218.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f437f86bsm10567966b.182.2024.11.20.15.19.05
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 15:19:05 -0800 (PST)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a9ec86a67feso55312766b.1
        for <soc@lists.linux.dev>; Wed, 20 Nov 2024 15:19:05 -0800 (PST)
X-Received: by 2002:a17:907:2d08:b0:a99:ecaf:4543 with SMTP id
 a640c23a62f3a-aa4dd57a0c5mr426803466b.25.1732144744981; Wed, 20 Nov 2024
 15:19:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com>
In-Reply-To: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 20 Nov 2024 15:18:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi=GZ7766ZBoT11aAp=Nqw6Uf8eVvuyQAycXJ1TR=5e2Q@mail.gmail.com>
Message-ID: <CAHk-=wi=GZ7766ZBoT11aAp=Nqw6Uf8eVvuyQAycXJ1TR=5e2Q@mail.gmail.com>
Subject: Re: [GIT PULL 0/4] soc updates for 6.13
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 20 Nov 2024 at 14:58, Arnd Bergmann <arnd@arndb.de> wrote:
>
>      12 Jo=EF=BF=BD=EF=BF=BDo Paulo Gon=EF=BF=BD=EF=BF=BDalves

The name "Jo=C3=A3o Paulo Gon=C3=A7alves" seems to be correct in your actua=
l
pull requests and in the git tree, but you have something seriously
wrong with your summary generation locale.

              Linus
