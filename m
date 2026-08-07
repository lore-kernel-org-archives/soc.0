Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28CF2D2397
	for <soc@lists.linux.dev>; Fri,  7 Aug 2026 23:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786144898; cv=pass; b=Xn/I8Zx7SaEq8KDsGRMvSh3LLxLGqeLCy3IaMLC3JgjF76OtHiJ+umdSw52vfKC0h5HDBmC0bMXSUnlIJ6oCmF/mZQGdxSPepr8VdITPMytghvB9il8rSFFRwNn6a5D2DyVCSYZ0jgexhBey4t/xf5ziZjv0U+7UI2d8oSolemQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786144898; c=relaxed/simple;
	bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PtnAIzJKWHHq2s+5tkY5yNeZ/Qobr1i32XD+OSyk3Z6hq6Equu6FA31oTHKk3nQf7Di1BWQ1iMUFTX0GA7RLtIfKIXcqRyQITV3UTo/s1Q8ELnBA1O72fnQtPLB8aq0WQ5rLe0sdppNcB0AIRyQk98FwY0xqgqMsaUPR1HRpeug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+8YrfCw; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+8YrfCw"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84eb072307dso12168b3a.2
        for <soc@lists.linux.dev>; Fri, 07 Aug 2026 16:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786144897; cv=none;
        d=google.com; s=arc-20260327;
        b=CmwhRqSYz6q8n+8hhJzVzM/OAtxxIXlrmqQxd8LzioqAyUpZRwHDUh7eviJjEIJgo4
         vJBe9PCbeYb5qTZ/QBZgF1fQZHsFCN5FQqIydOkHu/hlI3b6AzfnjkDjhw3YgeCtPJve
         C8mHAPtZOZWxcg3FSEcs54nXQvDsnlbLSQs6wZHjiAT6MkXhvCERyvkjBCWel49liwOt
         IPSjw8sKuyj3BJjVcOFCmyfkcb8qALpQhSBfgnLS2Jx+xF4+MAyxqbf4GN62pH+wxd7U
         pnRpaVebkzZLVrT2Xq/kGVBaf43DaoqkbdBr85/ThGAcpata2X7+Ln987c9aFg7ZdRmm
         X0VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        fh=ZURbbnsYy3gP9SYEQGSfjXWHd8iUxMvcfsuril890tE=;
        b=g17I8sgZU/Tt428+Cf3yotpDzb20yXjOExIt0+LczPZifUoE6crvq79VxAb4XtuOyz
         zVurdYJIOnh9w5jfPIL2FIS5Z0DCAK2QeEpUuGWEEOkwQOlQc7wxMsmTKMTryVFAfgw/
         Yfq08QivqIy1uKj6GA7RfL7JZpARZhOXmrKrjQ4nC6MDoJe6PiJXhmzcFnTu7mRpy5T2
         Lut2O80TqQFYDjwHytqtMG5zaMdL0PeXPJanM3bFOP9mql0WKMw7/Q5QMFqKJA1WQq2J
         TMSBakndBPuREGJGWcAiwqF3pnH4Ygqn/PE+Os/aSQW9Oe2+iC6RThD0hQ1njokVInkt
         he3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786144897; x=1786749697; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        b=B+8YrfCwxCCYgxKgdVhYF4zF2ObEQLdcHQqoQaz16AjPD0ftiTh4rd18VsKK7yhqRI
         7jjKKiOH12Dok40Hce52vGbUqnCPq37IDX5gc/44XFp6Ahld1rr9qY8r3K03wZ6eSGJl
         4BIKTjJb7/9p0wHYclbfYe6jVxqoWZ1QdTD6MdoKtRNofttHe2aFXRotj3nnPVXqJaXp
         xLL+IUZkAoI4OBhm9D65v0rebxTCP2/tJ4xzsafVQkO9HF3XNpsku7Lf6+aLTWJZ8mb5
         nuKHlV707jZOQ8PEOxmVKzsB6pbKt6V9RoJtdXsNWphgou7XXrYY6Vbqzy7LzBcNQ5+L
         tUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786144897; x=1786749697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        b=W6HXJ13LCo8yeUzTUQWzvUGYtBkWpaCxgJlCoOg4HihYhBm6x5P0p8iXPPs8pCIdbX
         P/k6O3BwD0yRRNvLqhfGaf9dJ0wkosJPNdrDTTvu0CK/IfN/r/gwf4tAI9ldhHIpDRIJ
         9ZNE0nKnPL6GOmU7ob33WKzhHsrPD22AK5lEP7UzQohyW/UlydvcSwFakZ3QPhuCaD6C
         PdENRZz1uxt+zviM/gm7PBLVGdl11gCrmc/PINEtLf0rkbzg8z/mSfRLdJeZdqaVEXGG
         iYTrDqgNLgefuEu0D+6S36P0Ya+l10D48KB64x1cLZALjkesriNhEs+h+Runw6JbarIw
         bv/A==
X-Forwarded-Encrypted: i=1; AHgh+RokIaHB7Spf/d6mmi5A9D3u8OYkqBhaZeVDjZ/CCGti7uOlADXnkTUEJ5qsOxxcyaok4zM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxHzdN5H2zYSd7y2HCHaaTYIaS/XRxzmqjCRYzaUYcJNEhSuy5v
	KbHQdnK1qxKwdrZ3gjgo8kfkSvyu2ssf8TD6qPfoODQtCxp5aJSINy7srPKVcADIhOsVrXlXDY6
	itMRq71Z8CpnHMSw8vm9YPbypPTgOOMk=
X-Gm-Gg: AR+sD13gg9PUDtVg593fryLPiHxMCCOv+LH3FNF6w0VBHxBwE/baRlO9/gyGFZH8qin
	nepxSMgdA02SJIt7h2lw89ERcWafQjmmzzfKGUPnrtt8TQJkLE+1sLetlKgZPj7Gl6RYeVili3Z
	B5SvNgO1A21rgWpmOFIRLd+ggQ7bWRvP76mW3+HaNz7+1kU8NRklukFkNz5kEKPf572jJUeQZUZ
	R7urixpdTHC+IRvPLZ7Frrfe+DFL2oZwlT/G0DTnEQNOgEW3buhOMVIdmo8bLcO6mGYjeLowWqw
	oStuqQFVK37nXZYomn3N1V581bU8kWXuNVxMc5aWQLxsUoJHqB3c4a+hbs8H9+u5SwHQYr8W00f
	UgWW9XY8RnOBgq1OI9W0b5J8UqqXFeRYAd5hDVSKQq56DVxDk2uGuiQD98UmU
X-Received: by 2002:a05:6a20:2589:b0:3bf:99ea:aeb2 with SMTP id
 adf61e73a8af0-3cb8646fe2bmr20610739637.4.1786144897090; Fri, 07 Aug 2026
 16:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org> <20260808.074341.1056015191905819805.tomo@flapping.org>
In-Reply-To: <20260808.074341.1056015191905819805.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 01:21:23 +0200
X-Gm-Features: AUfX_mzt6ITrqPgmG06xYNP1noGEoKAQULArIyU1uaz5hrUcXcfHz6eFuH5RVl8
Message-ID: <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, arnd@arndb.de, krzk@kernel.org, 
	alexandre.belloni@bootlin.com, linusw@kernel.org, chenhuacai@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fustini@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, kernel@xen0n.name, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 12:43=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> I sent a fix for this bug a few days ago:
>
> https://lore.kernel.org/all/20260801024841.786664-1-tomo@flapping.org/

Ah, right, sorry! I also saw another one with `rusttest` for arm64 and
riscv64. Did you see that one? We probably need a `cfg(testlib)`
split.

Cheers,
Miguel
