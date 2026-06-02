Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA9E373C00
	for <soc@lists.linux.dev>; Tue,  2 Jun 2026 17:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421370; cv=none; b=UsH/NEC87v7jWsDCjPd596cZHRqbAu/RSiGn1wUeWkn4VWIpEC2//hzggxE5ZwGwKLB8pdWKGE3AK5fCRV9tB6SK1NltcBc50JiGcCg/7vYCTVLZHqfvRTJGD82e2q3r4v6clP1wvJEg0nhcjIq94C1GxJPz5dWr2HJUGM1DBrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421370; c=relaxed/simple;
	bh=8WspfoL4gpujRM39oWh+TRtiUAik2MWWILwxqkCuc6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L48rn02OA/wEazI6jzs1ooTo62dTVlrgIOPR99GCxBZYy8S/8P6JTiGrfw9yB93XN9KU7G/iXpeuFgU9gHtKA/qwmucB4SigmihD+PC+HLXpQbK7e7KQGfpfT6p9On/YEO0ElxPOXsa/LTNPcbROnBseOGWTXMHs4OnS+LUU6+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=apGzBkEp; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="apGzBkEp"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-687ed9aabb3so8944130a12.1
        for <soc@lists.linux.dev>; Tue, 02 Jun 2026 10:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1780421367; x=1781026167; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1e86C8e3IWXqubUsFl/vjUmwWGVV15AJsQpCoxLfCDc=;
        b=apGzBkEpFG1hK5mP8m0q3pPUkiT3kABpJibLl39p9v2Xy0d7WADIYGcKzjVflXi/jQ
         Yr0fNQLMUUbN3yFSMsskEbND5frC3KnfT8wBkSaWWwhctNtDOTbejzUZqHZswA/C+cYP
         UVTXo2yOn8CO/kqmEctYN1rTcCOzO9DevQPqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780421367; x=1781026167;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1e86C8e3IWXqubUsFl/vjUmwWGVV15AJsQpCoxLfCDc=;
        b=UP37tAc5zN2RDybbW6C7zJDpqae/vUDWnzXd5l6p1IjWu3U2HUSXCXIAIRMYqUBwMd
         b9yRSctowLLAwxPK6os0q56xPYCZcoIXtzCLy8ttfY1TSxXcPMCJHG2WOtRgtsM36S1l
         mRiIyGvmPMV/Ks0BeBRz67UYgMlDuEW9ue0ECPXAo51dOQwxr0NycIxtARGe4jLJhk4y
         /P0x8Xm3oqf/peDv+anSWtn98IrpZnDKDmPrCu8UtzCHpZTqMdkbfqd6TrDHi8u8tpBc
         X3VJGHquaLLONNNj6e/ht+fB7d5JP7K7Q0RFSd2IpHciabJUss2PNP5gai4aRBqe0/nU
         WM2A==
X-Gm-Message-State: AOJu0YwdJBH7OSYyTc4N6cYmv/QJzlbttYn+hdZ7Jd9Q7it8NY06sD8s
	auG69Ai67Z9dnYALqAI0THBYGoAmKxq8awC6ENrWZFbW18aABBfpqBWgdrzL0RyaYs0qxr70Urz
	Qokn79CA=
X-Gm-Gg: Acq92OEIkRGnXcyXSZ84lK8bBjYnYFf0jTNfCRZ0Q+LA//xYLmqB/UxU6K+37f51JtQ
	b+ble/ACnPsrCR+lWpVXLfEL8pH55HUcVf+WNsXFkcCSnNwD5QyQmLbKJ41DAh38oE66hLWV4I4
	rcJUoC2awnvioRULbgMytq1/Dp4Kte2qXOk/KTP6G6l4qniPXmMgdWFeyIz4RMIhR0tX42hBfL1
	astWQWSe0zAWKBS3V7mTQmZ0WDGRsAbGaW2s2gEQy61r2L+uwU5fiZUezfaO2VhODVJwpMY7A3l
	9nC295IT+w29kJcSkPPsvWXMmML6gACB4D9i17Z5ZNUizstIKOaKdR3HIaZvYpUHw9klUGlGTMn
	WYjqnZpkqNre2QAcDBiLDECoPEgn/K8vOd0g9G3E80MfdFbTj6chSj20Huduu3KWg2FIOuJZsxc
	/8CQxuV7PVI6MY0KO8eUMKQ429F2dYF9rU2+YWKoqGQi28Nn+0mBG7gb6iUhurTHhB5BrEPVko9
	yMSyglT2a8=
X-Received: by 2002:a17:906:ef02:b0:bec:fa92:d370 with SMTP id a640c23a62f3a-bf0611033e3mr30758266b.33.1780421367351;
        Tue, 02 Jun 2026 10:29:27 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf05177150esm21272766b.5.2026.06.02.10.29.26
        for <soc@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 10:29:26 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-beb8a08a6c8so486079066b.2
        for <soc@lists.linux.dev>; Tue, 02 Jun 2026 10:29:26 -0700 (PDT)
X-Received: by 2002:a17:907:6088:b0:bed:7ce4:20c3 with SMTP id
 a640c23a62f3a-bf06261a692mr32768366b.42.1780421365921; Tue, 02 Jun 2026
 10:29:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
In-Reply-To: <7636fe41-9a6c-4494-b0fd-a55387b92f29@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 2 Jun 2026 10:29:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj=uJU0PFrRjqTuOKcYnN92V0FXyn_v+x7c6rWhLoJi=w@mail.gmail.com>
X-Gm-Features: AVHnY4JwG8vkxEEDUE-lF3DtF4IebX5U7ta8Sr6Fwn-szma_vB7QEtdj0pMqTDs
Message-ID: <CAHk-=wj=uJU0PFrRjqTuOKcYnN92V0FXyn_v+x7c6rWhLoJi=w@mail.gmail.com>
Subject: Re: [GIT PULL] soc: fixes for 7.1, part 2
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 2 Jun 2026 at 01:03, Arnd Bergmann <arnd@arndb.de> wrote:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-7.1-2

That is indeed a tag - but just a bare one, not a signed one. Please
do make proper signed tags for me to pull..

            Linus
