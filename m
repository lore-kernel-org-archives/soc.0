Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423731AE018
	for <soc@lists.linux.dev>; Fri,  4 Oct 2024 22:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728079755; cv=none; b=X2wnoM0Mru8Lz5rBXORpZCfiNNdomksHDZhgFZNRHal4rIsdPoDMykbLFkpce/pvtzbxNjEBFpqlc0pFEJ8Yt8cJmMDQ+2tIl3rtGHn532R7o+dXUS739Tifsz9OVC5XgBd6aE+MwioPs8pXwenL9Qr7Om3MadASiy+0tXBz0Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728079755; c=relaxed/simple;
	bh=TIg3IMhaT0ye8GFuRZW78WuPRs5cCfT/FubBhjwyMUE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G7yB/pKyD8BrW0+bm9WkwA1054W7j2xy0LxitMAWPWWTt5TKik/Uho/ZpFEHZJrXa9xMJpQV0Yh7l1kknBzLWJ8Lq6LyV+uDBLL7I25ZaVvj5Xpm8WbvKKroYMZyVWkITL9MqAG9gGHyiNWo2yVxyOKN7D52R+po8DRfnZY43S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=P3jhJVM0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="P3jhJVM0"
Received: by smtp.kernel.org (Postfix)
	id 36F2EC4CECC; Fri,  4 Oct 2024 22:09:15 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58F2EC4CEC6
	for <soc@kernel.org>; Fri,  4 Oct 2024 22:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 58F2EC4CEC6
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71dba8b05cbso2576584b3a.3
        for <soc@kernel.org>; Fri, 04 Oct 2024 15:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728079751; x=1728684551; darn=kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIg3IMhaT0ye8GFuRZW78WuPRs5cCfT/FubBhjwyMUE=;
        b=P3jhJVM0IRh+M46L1wu5lCKhe+YK8wGmFqT8bGLyrpVTV6KlrsFMGLVvg7QVIS7BFY
         cjx35IqlSwmluyRobjUM1UTUFq9JjZ9Cpe2woAZFxKbheWXa8u2S2exvTY6OyCBfKw6z
         O4qjY8pqJrN2wwHdblQCg8va4IUjicVJYfcHlXyyJY9e3wX6YpeEWej4vivKJVeNtJ2r
         /AnnSBDW4O8vhnym59CXttU0UPGtm2POwQno6FNKFjO9YCRhnzpv3JFgmTAIgGqaqJCn
         XHTnP8jwWkeOkYXgy3KVU/1dNAER/hbZLOEE4zdqTmJTN68QNks6PYppOF4UKPzM6zCt
         C7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728079751; x=1728684551;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TIg3IMhaT0ye8GFuRZW78WuPRs5cCfT/FubBhjwyMUE=;
        b=iJs4DuVj8QgvLPURZ8ybd9tFfnkxqlmx+UKfxsZx/pVpoaPnUpVepvBrRop2MI31l7
         DfnAkvXACsOgrKaNHruxCIzVHwGtMF/CzxZOJKp1nwUINs2ChImvHyk3X1Ct9uhljuH7
         qYwg5BM5IJoFrZaNUEWCXPVUJq/0LN6oCNB/ftIkTg5BK5MaXZMTyYwiPuIiLjbDEQpE
         90MQiIKeRGWaIDs4EHdqQe4J3uE+1EQr0t1Knw6AKcXdfO+qCfFidE4chQKyBgzlU/lu
         lvSD0Whm3Jf7Myakbz9xbzs/gssDOfEtEFnVrV+FUSASwsM60IhqDVVaPWRFwuRL4JfE
         f19w==
X-Forwarded-Encrypted: i=1; AJvYcCVj3DdMfT537tg9NpdAGjRODRUIio+VAXi4tZKI5QlDrEfFgqisGc/4VDYHHiNBDOv8P4Y=@kernel.org
X-Gm-Message-State: AOJu0Ywm8XXTSl2pKqXvZoDhQLk48VOWCJOIBr8YM+SXFgpKnXIT2j1q
	crJNh6t2BK5fT2WnuQ6k/1bsKmbWV/9t+KtkDNo3cM+krrVb45sFCtHhUW5QUMo=
X-Google-Smtp-Source: AGHT+IG069EnxRv30+3RjzhAK77wi1qDO55xqPHdUqxs7JXDSV/D/reKudXwRnQMxPPARwBk4/0s5A==
X-Received: by 2002:a05:6a00:cd1:b0:717:8a87:7d02 with SMTP id d2e1a72fcca58-71de245eb16mr7947141b3a.23.1728079751622;
        Fri, 04 Oct 2024 15:09:11 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0cd5006sm360165b3a.77.2024.10.04.15.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 15:09:11 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Arnd Bergmann
 <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, Jonathan
 Corbet <corbet@lwn.net>, linux-arm-kernel@lists.infradead.org,
 workflows@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
 <linus.walleij@linaro.org>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Will Deacon <will@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Conor Dooley <conor@kernel.org>, Heiko
 =?utf-8?Q?St=C3=BCbner?=
 <heiko@sntech.de>
Subject: Re: [PATCH v2] Documentation/process: maintainer-soc: clarify
 submitting patches
In-Reply-To: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
References: <20240925095635.30452-1-krzysztof.kozlowski@linaro.org>
Date: Fri, 04 Oct 2024 15:09:10 -0700
Message-ID: <7h4j5rjzax.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Patches for SoCs are expected to be picked up by SoC submaintainers.
> The main SoC maintainers should be addressed only in few cases.
>
> Rewrite the section about maintainer handling to document above
> expectation.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Conor Dooley <conor@kernel.org>
> Cc: Heiko St=C3=BCbner <heiko@sntech.de>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Thanks for writing this up Krzysztof,

Kevin
