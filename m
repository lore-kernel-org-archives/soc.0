Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26ABD433A0
	for <soc@lists.linux.dev>; Mon, 12 May 2025 09:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747042512; cv=none; b=dvOAvYX0yKz8lTJIqSt3zLAlrsRo+WsDIyIA0q92JPMSb0UyQh6f8/BsV+H9w1uYfQn18bcxjiMr8bKbddV8zuD3FQTuVgR3D2BCmmoq9G+bWQRAa620DAKy/ugX/qXjHfHOAXiItGGjrdMj+wOx9WBXd3b5NAcGlLKnTN99jtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747042512; c=relaxed/simple;
	bh=ObVQoDKUuckgW7L+r44ufSfyEy83Jr585eRCCBG8s88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D1q6i7OeEILwbAuznXJAW4Am6kakZsJOoGZSZe0IlDpj0FeRE9KGpl6XrMJqu5IlnQvlWLI7zdRtFkf9CIzhR9PsUx3bWyBvGvgBNElr/7xJHZZ1yO5TeX6Vtmunoj0Mju+R84ubSooepFt78C8Ma9qLttIKB86uzVL3FjAfaSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id 9F466C4CEED; Mon, 12 May 2025 09:35:10 +0000 (UTC)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9407CC4CEE9
	for <soc@kernel.org>; Mon, 12 May 2025 09:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 9407CC4CEE9
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4def1dbfd50so1014012137.3
        for <soc@kernel.org>; Mon, 12 May 2025 02:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747042508; x=1747647308;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqsPLv9uSuQweVXtQM7sHRJP63EkcIqTxw+FruTh/k8=;
        b=FhXDx6DBsOLDZOH+Wl5HsMi9v3ZsYxp/TTLYM9oSuQaDCkhQcQsblON2wPt63gFKBo
         l8SPm8o8cf8gdmy/DwHBu+rfSzKwRY4kRTL+OBR2M00+YJGx8vKCMmCCGf7GGDJRdpxX
         MrJY2w3q2anqptZgZTAduOeNkQ6C7BF9hnt7G6SXJ5LBp3Z38ibA1PECUQL1jfeCUbO3
         N4qqCFo1Qilh66Yv2q8Qa+T7FBilbIYBa+EUuvf9W2I3QTOuiSIdR9J+HF62HZTCvEAA
         Z/Jtd8tQzHHV8Vr2QyBX7RzRuyYZ2xwqnpgJ/vvlMz6+P/EBch1cm3nfYn0Ig/3gmCnM
         swEg==
X-Forwarded-Encrypted: i=1; AJvYcCX5pouwP6r8gPzk683ua87l361jmWIuhfgF/73Su7W+BmLtNcgtQPHDtpjpBrXFA+CylMM=@kernel.org
X-Gm-Message-State: AOJu0Yw5nD5XmE1iW9aM6slPzyEp+7igS009BIOTuTEnOjzQ4pl+EFMp
	eRX5/6mvbaZHUqTHYo63EHCY+KrTZBeOqNxfDt96AIJQP85M5vi06GHpxcle
X-Gm-Gg: ASbGncv0zNhOSQ20WryYncwROeKm2FSiz/4aKJZQEHWbK7ohMm+1545FGp5xhHhH9P/
	nxboMGXb8RbKm+gV53Ezce0vK9teeewgs/XzpaWg8JrMVh9ikHXMjGGEWls34vBoei2w+e1ecUl
	D4iorvl9SdMroVffxzjpGrpxpL37SABTy+qim43Tkbvawbo4ACeNmB3nilkWHHio7tMIh+ZP5d/
	/8aVyvlaAkmqpipnT/xl8HKc092zaMBLHk987bOFlIUn+QxqYJU18zO1lQ+NPCflhq3/672IIJc
	iPo4kYdY7P28GTg1cJoqpC2awvQ2YZLvXUaSgh/PC5IdHw6om5zZHxu/IoBdFuj+JdJKakHKldr
	e/aXcJx3VluTf4BtiNbYcN5vY
X-Google-Smtp-Source: AGHT+IEjZk1My9AXjZ72o0tDJLIhOjoVWmgVuaNI79k9Ayz5gkUscuxy7aevmZza2EaQg4TZPLUh7A==
X-Received: by 2002:a05:6102:2b92:b0:4bb:e36f:6a25 with SMTP id ada2fe7eead31-4deed3608f5mr8939911137.13.1747042507852;
        Mon, 12 May 2025 02:35:07 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f626befasm4739114241.23.2025.05.12.02.35.07
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 02:35:07 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-879ed601971so952492241.1
        for <soc@kernel.org>; Mon, 12 May 2025 02:35:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVB0Fw935jTuNSYx9khrNY5n7OUnudnVvCXM2q7taniIKXljrH6b1rPYW6P3rXpGKUnrCE=@kernel.org
X-Received: by 2002:a05:6102:4b19:b0:4c1:76a4:aee4 with SMTP id
 ada2fe7eead31-4deed3d366fmr10212836137.19.1747042507550; Mon, 12 May 2025
 02:35:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1746798748.git.geert+renesas@glider.be>
In-Reply-To: <cover.1746798748.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 May 2025 11:34:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWHy6_BETqOOQqRoGCt8bdeG9psttm--g3kfP7jHZY0KA@mail.gmail.com>
X-Gm-Features: AX0GCFu6jsWjeoSVukB3E2LeU29ISfDMzfAZwuaDhJIL1puAnVS2NMOwOsemz7k
Message-ID: <CAMuHMdWHy6_BETqOOQqRoGCt8bdeG9psttm--g3kfP7jHZY0KA@mail.gmail.com>
Subject: Re: [GIT PULL 0/3] Renesas ARM defconfig updates for v6.16 (take two)
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: soc@lists.linux.dev, soc <soc@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 May 2025 at 16:22, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> This is my second pull request for the inclusion of Renesas SoC updates
> for v6.16.

Oops, subject should have been "[GIT PULL 0/3] Renesas SoC updates
for v6.16 (take two)".  Sorry for the confusion.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
