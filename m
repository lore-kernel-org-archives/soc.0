Return-Path: <konstantin@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13709C5519F
	for <soc@archiver.kernel.org>; Wed, 18 Nov 2020 18:34:03 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id C8F6820897; Wed, 18 Nov 2020 18:34:02 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43EBB2076E
	for <soc@kernel.org>; Wed, 18 Nov 2020 18:34:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Rrx1MHUo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43EBB2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=tempfail smtp.mailfrom=konstantin@linuxfoundation.org
Received: by mail-qt1-f169.google.com with SMTP id z3so2352929qtw.9
        for <soc@kernel.org>; Wed, 18 Nov 2020 10:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=4NkJYrNF369U6rbVST/wcnkOrXIy0K/iaR41aLO1eU0=;
        b=Rrx1MHUonTID2jqeEzf1ABQywILG/OFVH3RRxcOCmF0RSY0DDKOZK24Sbrv7/p4UJX
         p7CCxT6vfNKkziG18eknkQWcsQDe1j29F2ZWtzlpqBp1KeQVAogYmCFM6WhxZGL5bMQ9
         ssamwi/a/zuKhB0/utMS5ukekPB9IaUKHuSJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=4NkJYrNF369U6rbVST/wcnkOrXIy0K/iaR41aLO1eU0=;
        b=C/gof2+UiQW7K2XG/D8Bje4EsHJAEMY8lvBTHVAeg5w0vFmZprFHYZL0KmF7h5muQM
         QRDj7nwreUASlVL2bZpiN75PaRaHEAqv7HmfgYG5ThcH8LGM+JbkW5EWhYkS1uGo8oH3
         zwAQ+UzusnUpmBliptjjmwOLxUoTZmWaCQGZ8bBB9mbI5LYATkxEe9njnLDGahgSP8FC
         x83SKO7f765k53rtAeOXJjlndlJsahEydBYsKwJWKp/Y7BF8j7jWp1UcaCg3kuzzBg17
         5QkxmsOVgVr8YoB7R6SQquXlPjpsA3pKy5fLnWTdSlPkzPGKxtazUq5Bm9oOmw4ERgYs
         lgvw==
X-Gm-Message-State: AOAM531TH3XRKwwFwYKt13Ty062BTmN62rsaHQT7W4dDEb+/xSaBi7jK
	2YDO/ROhG9Qu6YJ+tJoAJMd07X7Kqp42ovvE
X-Google-Smtp-Source: ABdhPJyefQ/YOUSfOc7Y03yngYXLUCdmolxFS2qsKTETU113mo2SZ6SzCuZIises6eS1NT9f//nMYQ==
X-Received: by 2002:a05:622a:18f:: with SMTP id s15mr5964073qtw.10.1605724440768;
        Wed, 18 Nov 2020 10:34:00 -0800 (PST)
Received: from chatter.i7.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id y24sm15474021qtv.76.2020.11.18.10.33.59
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 10:34:00 -0800 (PST)
Date: Wed, 18 Nov 2020 13:33:58 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: soc@kernel.org is now on lore
Message-ID: <20201118183358.itb4xmsbapztzmoq@chatter.i7.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

I know that nobody requested it, but we're changing how mail is 
delivered to patchwork and it is now a requirement that all patchwork 
projects are delivered via lore.kernel.org. So, you get that part for 
free now. :)

Assuming this works and everything gets properly delivered, it should 
initialize the following location:

https://lore.kernel.org/soc

-K
