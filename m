Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6B82AE90
	for <soc@lists.linux.dev>; Tue, 29 Jul 2025 18:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753812720; cv=none; b=MqVxHfyXS2nAKna2VQY/qPoyvjygiXeaBfd79eniUcTyBhF7WrwihRca1QJMyApybtdw3HvftKggh19gfQSnM9F8UcS1vsEW2hmvkMYtZFIaH5XEETNiH6FK6LV2yRmBu8NBS6zmEivIFfdesn0wA222LnPeMiyivIATFIVVwL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753812720; c=relaxed/simple;
	bh=57u+F6SPbw9ETK1L1hEuDIvslqxqqcWZl/TehcN3dpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YVJo5XBOiJ1MUlI7MeKQGW0zT9Qw7aOxXgmJN0owXtwzsgquW2ML8NAT+PcUMClvylwmDjZmTwvvQpxlutHFhyIKNhVjCkDSZAUDXq+v7WnSZuNEyHIs7q8CaLJi2xBcXuy58kttHeBDRrGwmc+ErJj5JbAjRcXzuzUd7SYVeGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NnxiwHM7; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NnxiwHM7"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61571192c3aso1317653a12.2
        for <soc@lists.linux.dev>; Tue, 29 Jul 2025 11:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1753812715; x=1754417515; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwP3dr7YyDibVHyf7li9AJtXWtRFZLZZCBSKzcLCyxA=;
        b=NnxiwHM7J+DP23owip++PyHQ4Lcg69wydgGzUu3zBAXs+6VGw8jpiaC/BPvTVfaX2E
         CDSfKLQNzRzrun2QGsZvaGfOiSpnEmABw+MbC9p4TkOOc7epSylwnOtAmT6ndc9mogL5
         EBfMrTzdoMx9dB9yzeWu0/0e762rALyJ6qcPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753812715; x=1754417515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwP3dr7YyDibVHyf7li9AJtXWtRFZLZZCBSKzcLCyxA=;
        b=WzggY8d9rLfTrYtp4eDHF0joFymEXdnZGJANfT/yOX/v1q0bUOsAa5mCkoU3Ce1jyD
         7NWqxqZ7EC/VcoFF6uG4QCmcVGhytyG9gbXbu7/lL4RnaNk7JjC50rbFw4yRho19xMni
         EFsuoIZvI5983JNLT038bYvJA9IoDZpe0OMN6+fMwydiuRSRpFdArGDkD6m00EMeOyeg
         tVapqM7dGV6LsCQe4Y2JZE9yhMSx8w5Txo7+ADJgfZjIp/R874S4gZaIgJ5zbLZKckfZ
         75rhhSVcz8FyY+Tt4SncdOdRHp6Nj4bEhyQdFHzCLkmU9WcbLX4rMPU3nKNCQsxddk3+
         wFhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp0kIENVePp4d759hQ8YD4M9draBPOodbkoRxSLlevLoPE6dPK6+QqkqZJwy80B2Zrq1w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1EokWGFBcZQ6YxidnbFbXyD91PgtUS6rzbpmWZJOGIj4dyw5X
	broVQLOhGPV+E7fRTi5VKoyrJqVFKbOkM8aFGLZL4cklCPNEpg5WIjjXeI72GM8Zqy1tWMxXQxg
	qHvBKRnU=
X-Gm-Gg: ASbGncs/ujbImOVfpGDVroBfukhSPeVKe6RvYIRj9++dEofrQ6ZbkfxVLbSQbaZ3Vf8
	R+lxSEvRPj3l5LDgmZewPH82RwsJX9eBuNLVa/qVGkHy+DH+Jm4hksVuVoAKnN6pIlapLhLApCs
	JwEb4l5G6g6NxfEURnR0B/OrpKZPQItr7IMQI3gXolICWh1w2Hcrl6T4WFFYCqo+iNHCI0UHYc0
	dC9CLYgZMzaOHH+CUYY0eiiilqRWSCHPLuclBjYtchQs87wtq1Z8+re8iRtDYd/Zhi1EcmegeNg
	zj688yiEuQLvqcLF7Qs5feQqusMt8W8IfRRPFsT3z6xtVoK6jf/L6HVvIS5hj7n//fSyR/BonkA
	1TsoRSujo6iUshf3LNsANc0aUv/lgXH2P4LaMn5OU7VA9WecZHJ4GxMQfpvAGqZXGEm+PRhx2
X-Google-Smtp-Source: AGHT+IGquc3rL78rybQ6hlCwI8C63KjU6SGnn+hR07mUcRqfB1rYzwDKTa9IA+GNwzSNw9Irjk5SKw==
X-Received: by 2002:a17:907:25c2:b0:af8:ed6a:a9c6 with SMTP id a640c23a62f3a-af8fd6bc88dmr57486266b.20.1753812715105;
        Tue, 29 Jul 2025 11:11:55 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635aa3095sm617141766b.104.2025.07.29.11.11.54
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 11:11:54 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-61553a028dfso2753580a12.0
        for <soc@lists.linux.dev>; Tue, 29 Jul 2025 11:11:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW5xth1jRdCE0tAhK98Y4fWxDENAT8GwLjiO7Fy1Kw5dLof+zAFBwbD43zwNYpJi65gFt8=@lists.linux.dev
X-Received: by 2002:a05:6402:278d:b0:615:399e:d3ba with SMTP id
 4fb4d7f45d1cf-615872038b7mr479533a12.32.1753812713808; Tue, 29 Jul 2025
 11:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <564b7ace-bb5f-430e-a7f1-9f6a41305e10@app.fastmail.com> <cc7b0bd2-53be-4981-bef2-44903b64dd6a@app.fastmail.com>
In-Reply-To: <cc7b0bd2-53be-4981-bef2-44903b64dd6a@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 29 Jul 2025 11:11:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi4JiEFZ1ofX5Df5mvhYS4Ob0_JpHGd2VxNzDypWknqXg@mail.gmail.com>
X-Gm-Features: Ac12FXz1Qxn4crxv1oBy3yf37kVc7TYxrFXCgROlz1H2zNpBoR4Q1XkLw2GtmWA
Message-ID: <CAHk-=wi4JiEFZ1ofX5Df5mvhYS4Ob0_JpHGd2VxNzDypWknqXg@mail.gmail.com>
Subject: Re: [GIT PULL 1/5] soc: dt changes for 6.17
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, soc@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Jul 2025 at 03:28, Arnd Bergmann <arnd@arndb.de> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-dt-6.17

So this caused a trivial conflict with some of the usb additions (in
the freescale s32g2 and s32g3 dt files) I just pulled in through the
usb tree commit d1b07cc0868f ("arm64: dts: s32g: Add USB device tree
information for s32g2/s32g3")

The conflicts are trivial, but I thought I'd mention them just because
they put the DT info out of order wrt the addresses things are mapped
at, and in one case also had some odd whitespace.

I did *not* change either of those in the merge, so the oddities
remain. But I thought I'd mention them in case somebody cares and
wants to fix things up.

                Linus
