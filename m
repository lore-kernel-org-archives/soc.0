Return-Path: <SRS0=zac1=NT=gmail.com=andy.shevchenko@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 860BAC27C79
	for <soc@archiver.kernel.org>; Mon, 17 Jun 2024 20:31:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 6C1C1C4AF1C; Mon, 17 Jun 2024 20:31:57 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 74460C2BD10;
	Mon, 17 Jun 2024 20:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 74460C2BD10
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57c83100cb4so5443511a12.1;
        Mon, 17 Jun 2024 13:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718656314; x=1719261114; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpvMO5cI5dax9B8AIQZmgNmhnSAXFWQhOxhHDlxWOz4=;
        b=U643VtmFKXdeeqrheLzp9HqGz/b4w0gAG34IjaZBZS/LYYvtuN5x/je1P6lp68dJCN
         sgDVDG21U52yA5qYIISUCTXa+tKYDVxgrhcbZ1BuloMPv8lFbArBuLCc02PkV7u4qzbh
         D9W9Csn7VhtGbSUlBHySE1z+ctJaJPUGsuDT69FVIGd2eRVNf7tgp51TIoErLgeOUW/W
         ZAT4sqEM1EJUXMd4bvf5Ee+B7f4Fsk+4z90YQqmXP2wg80bqrBK160Katp68OSnxaOCn
         YZ85GcYaKp6+rWCYvFDX00nE1Nfrb/EPsBnbARZg1hiJij38e9KGiJHu/5c65ZvmOmLw
         pPdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718656314; x=1719261114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kpvMO5cI5dax9B8AIQZmgNmhnSAXFWQhOxhHDlxWOz4=;
        b=LF8FLxe5VkxDs3f8yQn+bvAWQiBbz7o8Epi11rdC0AnSWIGzLJ09GJ962izqfLe2Sd
         g9aFYP5hugOI7iiMbBHB5oHQnOWfV6+Uw6AIEAhYzPLjgZgY1fOa6jImO7DJ9/7tN4KT
         okfzX2WqkHJ/V/HbI4cMqgNi8iO4LuO2rfk3rQQcwlbAOu3p5FFf4Kt1A606ouIBO1ZV
         NKGIlFr4LfXHb95xxH044abUEnHPjDTWaOTLYNnitLDY5prJzMf8T+pgxlQcyhduM3js
         tWtntZAvHovun4iIaN3nSibRvEJgOmd9EMywPNkJGM0hKTxdo2GeGAgumwJfnKA74MNb
         Ut0g==
X-Forwarded-Encrypted: i=1; AJvYcCW+7Y67XOROXonmLX5LjOoVS9Ax2JNshxzRc6A1Gd6hxvENa/U9ifqEa6DEsqo5S9v+NlUH6Lq8UeaEwFDcAzkODZGRfMkp53wF6Jpc9d6YUCjlLkbna+Rl2YNgLuyIhQ==
X-Gm-Message-State: AOJu0YwdgqPljt2AIntLJoV4MsweCfySbw+F9H4BPXOHyL7c0kyrLtSn
	pYF+vQs3o/dKk0NMx3kfU+n+3+BtLKSbhudHq1+0yljHe8vrnBtDvBK1gcy6CE+0PIampvoLgVE
	OUuT1brWF0B7Wm5c1Q1WEtRjEXRIBpOk8
X-Google-Smtp-Source: AGHT+IFB/zsVeGGOs6+LN0qcJ+nNw4H6xBecQDVFIxfylqK/gm158pc7Z2KUbXeJ9BCQMFuI6T1rybvtLM73XOQtxQ0=
X-Received: by 2002:a17:907:cbc3:b0:a6f:88af:1e77 with SMTP id
 a640c23a62f3a-a6f88af231dmr278420166b.68.1718656314233; Mon, 17 Jun 2024
 13:31:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240617144532.17385-1-kabel@kernel.org>
In-Reply-To: <20240617144532.17385-1-kabel@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 17 Jun 2024 22:31:18 +0200
Message-ID: <CAHp75VdfwARcmYFR3utm+ZH_EVdFPYPBYGq=4oU812UqYAqU8A@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] Updates for turris-mox-rwtm driver
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
> Hi Gregory, Arnd, Andy et al.
>
> this is v3 of series of fixes, refactors and cleanups for the
> turris-mox-rwtm driver.

As far as I'm concerned this looks good enough to proceed.
FWIW,
Reviewed-by: Andy Shevchenko <andy@kernel.org>

In case of a new version, please address a few nit-picks.

--=20
With Best Regards,
Andy Shevchenko
