Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14AE1C27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 19:47:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id DA491C4AF48; Mon, 17 Jun 2024 19:47:15 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 01F3FC2BD10;
	Mon, 17 Jun 2024 19:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 01F3FC2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52c815e8e9eso4809148e87.0;
        Mon, 17 Jun 2024 12:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718653633; x=1719258433; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2sZHc9c3C45R7HyLng9Wt93ETPepngcDrNIz13QvLUQ=;
        b=DayfdmRX6xTHGz3VbRqFAMWu7fDxvqrG0VorGSJLpIHbqkSWtEY4fsBn+7lsweXlue
         8NkQ2HG7xU7d3RzKBKobD8mWUJRJIngZX0ckHkqMvnM4oE6cCy8o2YaZF2ej2NeFZ+bS
         ISodhDqnMVa2v68gJlZ5hXZq/ROFiMF+EjU0DgOJo3Pmv72U3vG12xEQTxC8x4sL9sc3
         4fSKVttbVznG4jU6JK/qlC9CkGAu+ZInb50fr1pMDeGTSe/ZuwAHAipDcszboONdlNlU
         JiTAPsEEnh5P6WXlVIzPx+iAPq1Jp2f8YfHdzQ76VAbIjcyFs5DHR5Vgw2mWm1iBnB3V
         7DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718653633; x=1719258433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2sZHc9c3C45R7HyLng9Wt93ETPepngcDrNIz13QvLUQ=;
        b=ArWeG6c9HKIk0QZh8Blw7PBPa9x7qnmXUR00atiIojlNiYDPSgQ3ZjjgCHSFN2vK62
         l7KICCgFQyIsxWYcnTkyGHUXJbDXRy6Wv3c34tfzFFRmobMaiBVvjaSlYJ+cQ25vIPRJ
         pt0ZscIYRTI7dHdK9dNhvd/RgmuJmgzZ/xSyxbtMyRjcYHUINo7/trQ4eE7Xzoj+GoPh
         MrTbYaGqFULgwod+srjrdrTrJy/EAdDPYwP7tNsvu9Ti6WFeF8F+ZUA8bPDGfDsPWUvp
         JDtLOnbgc1agcJ/s2WMFQUAg3jD6HCkxNBwD7QhLI1LWGIKGK4FR6k4T1nO1kYrCm5kT
         UeHg==
X-Forwarded-Encrypted: i=1; AJvYcCXdCsFGyY0lJpX3KdXbewJO790tksV0k4gFthRu763B52f7fekVW2vTbSPfP1+t9Uj1J0C38r0i8AqiMnMDQIVjpA9ueViWEoONA+8TcnkNBfKjJmDgC4cE9hgRpS5b7Q==
X-Gm-Message-State: AOJu0Yw0eWlmWilk12cDZYZBaQ1TfhuE4u2cmggdDW4PIqSi+MYfKC0M
	N1G9BiCncyPKgnP5+YIxLLJc05gZcII70gyfeWmpp2UCuJuz3tnJNupmImyErSUuXoAnXxiTcch
	HZ/M5rtt/qiVnSqUQtXmYqhmbAKUWdC5S
X-Google-Smtp-Source: AGHT+IG5T1mxUe6mUfmw0hc1onyJk8/W4FknaA5tfU6wF/hxVCxSEtH/BwfQRkkZtLhi0rdgZ4ob1HHCFMLkinHA2CE=
X-Received: by 2002:a05:6512:20cb:b0:52b:bd97:ffde with SMTP id
 2adb3069b0e04-52ca6e55d56mr6145413e87.7.1718653632549; Mon, 17 Jun 2024
 12:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20240617144532.17385-1-kabel@kernel.org> <20240617144532.17385-6-kabel@kernel.org>
In-Reply-To: <20240617144532.17385-6-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 21:46:36 +0200
Message-ID: <CAHp75VccODLAjAA7-WWWj68Lop3UykO+WiWpPep6CCYUtCDxxw@mail.gmail.com>
Subject: Re: [PATCH v3 05/17] firmware: turris-mox-rwtm: Use the boolean type
 where appropriate
To: =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: Gregory CLEMENT <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org, 
	Andy Shevchenko <andy@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 4:45=E2=80=AFPM Marek Beh=C3=BAn <kabel@kernel.org>=
 wrote:
>
> Use the boolean type for has_board_info, has_pubkey and last_sig_done
> members of the driver's private structure.

...

> @@ -67,13 +68,13 @@ struct mox_rwtm {
>         struct completion cmd_done;
>
>         /* board information */
> -       int has_board_info;
> +       bool has_board_info;
>         u64 serial_number;
>         int board_version, ram_size;
>         u8 mac_address1[ETH_ALEN], mac_address2[ETH_ALEN];
>
>         /* public key burned in eFuse */
> -       int has_pubkey;
> +       bool has_pubkey;
>         u8 pubkey[135];
>
>  #ifdef CONFIG_DEBUG_FS
> @@ -85,7 +86,7 @@ struct mox_rwtm {
>          */
>         struct dentry *debugfs_root;
>         u32 last_sig[34];
> -       int last_sig_done;
> +       bool last_sig_done;
>  #endif
>  };

A side note: At some point it might make sense to look at the
structure layout with help of `pahole` tool and maybe compress it a
bit to save a few bytes (it might be feasible after this change).

--=20
With Best Regards,
Andy Shevchenko
