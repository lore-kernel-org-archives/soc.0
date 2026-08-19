Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3943A1799F
	for <soc@lists.linux.dev>; Wed, 19 Aug 2026 02:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787107632; cv=none; b=qKxi28wL4JJ87XDMn9mX4cXpvSIjtyvOfla3CSRcSql98bNTwS7wcujxBj1fLe0bvDFuzscP/wwNtPw6VsiCxxBT52FTeiRmAEV5aMY8Gz0Td5oF7SE+g1Ic9znW8/t0Rj5MQFHM4UwvjrwngO038Z87i5p8rIbR+XXRVwo+GOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787107632; c=relaxed/simple;
	bh=DzQMTThvKa+gao86ao42kJmIt5SbigkQa6w2+JHJYuE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KTaCR7RR/78iiSxlmercyH+KtM12T5qJ24nk6D7q2eTc/9tavUhXXOSnBA2Fya7gt2HReJuvPLAErRxXAu7/h+g3H3KgcSFUtq0u04HPh9TaJ9jSOzHyA5Dl3dQT/4bXoWat19bQECxLCnUkIGMZYopuuGx9YINb1hxl+b5f/8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=N+DcWBS4; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="N+DcWBS4"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so860806a12.0
        for <soc@lists.linux.dev>; Tue, 18 Aug 2026 19:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1787107628; x=1787712428; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reG8oCx7W3u/gQWcPdLL2+Oqbj7dXw9wfH6tZtX6cpc=;
        b=N+DcWBS4iFlsJD73b4wN8oNnZ5bOwTtq4Erhca96LLwCjh4ADSv7mqcJARLG8obYo5
         esuYYgFnN20wqwkZyZg4y+wdj2w4EU/cdbSGppB+nWFcBjJ3q9UpiM1xbkuzsTL0mbs5
         pJbADK9ex9jQJ5nkE/ur8aff8RUBRTQxPVnxE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787107628; x=1787712428;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=reG8oCx7W3u/gQWcPdLL2+Oqbj7dXw9wfH6tZtX6cpc=;
        b=LTDjS9mD3LOAoVSkJ18gTCZYZgtVX/leGONYqSrMSgVOWHbFZYB1eDOCa5bVUHYWiy
         zDneTEgRzssEN+K1/Tad24fSG63R6ZjMNRqAK0Ei7jWLQN3rCdlT+cJGrup4MJJMRAHC
         rvY9SOpEXybbMkFSpTag5CkBayRREgFV3Ge/Uosjzn6lASZLJT0YlBbqNJFeAAs2/Eq4
         Dz2zr3Ilnk2k2emmBtmjtbq69c1Dw5Y/e5d8jFswU3VgqA7rk5zhoUURcmjpXZCTK/SU
         xX2uxWQAOhIYglPEyhWF2DnSi8L2HSS7YFywUDqGGIz7evWkKs5XHViCHRJUKJ+QgHn1
         xMzw==
X-Gm-Message-State: AOJu0Yx4JP6Cn0OOwO/6PSnphsm1+EPjemdj4/YYM8uF00JTpqn1PpNq
	UOWd6LKW3/ZstFd7wTnYzXyvvYn5eKKg5UqkTg0tbuHbZzbYvpcbH0sKkxRmUBGeoDyycJuHWOx
	UtYJQx1A=
X-Gm-Gg: AR+sD10nWAi3RQoR2EFSim7G/YIx34IZs4mS0MiDH+14m7DIEUwwKkUc2HRvPTGZMiB
	4Bypk4xdS0s0rJiCuhd8JJgbAlj9du0gpYV7pr4JLrShdQBkmAkRr2w1JUCrzWmN+U7SRREu93k
	ie4lpyiTpUS1Q1xh27MQoaDcXNL7GXihUYM4Oa9LufhSVkt7wDWzObOcTpPsfUN/EBzSFF5MQpl
	3YsIrjfQAnShTFVQhYG8EUgzbqvAbNUZOyyqRoRfbZZiVGfDI2A0v0A/C2EwlZTVMfZT0IA8L6Y
	qg+ABvDWW1ySL8ywbT1F9ljgSVXC0Xfp7/LmrRroDPheaYrXl2Vld6AylXlD8705uahnf2JRvjK
	wXAtqgYt8iWWaeZdSh0vaK6w23dgsrTgExxd2xmsOMTnw/EsWumwz3S64E3PHyDH0tnEXkh6ALO
	XPr4az1llQXjaiKd2N4bwetV5bK8J2S9/KSoo0I5zOjwyXw8q2CDiiimlg/1GE/BIM9j7GRcEhf
	C8EUHIS6TCQskg4TtCUnxyhdaVdK8yjX+pjTg==
X-Received: by 2002:a05:6402:3909:b0:6a3:6d6d:2296 with SMTP id 4fb4d7f45d1cf-6a4032a686amr350601a12.5.1787107626062;
        Tue, 18 Aug 2026 19:47:06 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff170601sm257275a12.25.2026.08.18.19.47.05
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 19:47:05 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c2055573c8cso78146666b.3
        for <soc@lists.linux.dev>; Tue, 18 Aug 2026 19:47:05 -0700 (PDT)
X-Received: by 2002:a17:907:a643:b0:c21:7f24:968e with SMTP id
 a640c23a62f3a-c23e87191camr63000666b.11.1787107623525; Tue, 18 Aug 2026
 19:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
In-Reply-To: <8329f199-9208-4963-b745-089610400b3b@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 18 Aug 2026 19:46:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh8khg-Odf9cg2jWe1jvSviTwGgKG9vUDzYNdMzgmxDhQ@mail.gmail.com>
X-Gm-Features: AcwNN1U5hCSOqELF1dgLrDX5FQMlkygk01pcrVdlrkThrmFuHxD18e8gcqt9Rlo
Message-ID: <CAHk-=wh8khg-Odf9cg2jWe1jvSviTwGgKG9vUDzYNdMzgmxDhQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/4] soc: drivers for 7.3
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 18 Aug 2026 at 14:17, Arnd Bergmann <arnd@arndb.de> wrote:
>
>  .mailmap                                           |    6 +-
>  Documentation/ABI/testing/debugfs-vfio             |   26 +
>  .../ABI/testing/sysfs-bus-pci-drivers-xhci_hcd     |    2 +-
[...]
>  tools/virtio/linux/mod_devicetable.h               |   14 +
>  tools/virtio/linux/virtio_features.h               |   79 ++
>  2565 files changed, 15693 insertions(+), 8154 deletions(-)

Well, that diffstat was just garbage.  The real one looks something like this:

   121 files changed, 4566 insertions(+), 1492 deletions(-)

and actually mentions files that make sense.

This garbage diffstat is normal when you have multiple merge bases -
git will pick the first one it finds as the base for the diff, and the
diff will then contain random other contents that came from entirely
different trees.

But the fact that you have multiple merge bases also means that you
know how to merge with git, and so typically a quality pull request
would involve doing a pre-merge test in order to get the proper "this
is the diffstat you will see after a merge".

I don't actually require that kind of better pull request, but it
would make your PRs look nicer.

Hint hint,

           Linus
