Return-Path: <SRS0=CKL9=FC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D512AC63777
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 16:36:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 827A924682
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 16:36:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mx/WKV4u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j947Wy9p"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 827A924682
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6AeP20GW1R4qGhWVxjXcPBZsqDNyHr8Z8QWS30dQQps=; b=Mx/WKV4uLDZqCbNbaiRC/I/Mz
	4NfWJKyh1hJx72jK99VbChizyrXVZYwFuklhG7ZxPfqqNFo4NZtzElmbZ8X/AgIdFfWT6PNP9Et2j
	QiDGa/TpJMiqKQp85k0sLJubTnkuzh+KJfZ1p7ZJaEq2V654EhdIRIuaTsQ5EaTEsvYUWi64VPlUm
	Uv2UHWLzJAyEekf1LLFjQ2YY6fs5dlC6jUrjo6kEio7CPdyWF2eprOmgVze7k6eRa7WrvOiPjhGC7
	Ozqktk1zbZfU7KfqiGvGh56uOSHclXhvRQDDuF4oWmH6kHCPIrDaj3GYCoranzjOSvOTWbVy9s44P
	Yg7cQtnJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj3Bf-0002PK-AH; Sat, 28 Nov 2020 16:35:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj3B1-0002A5-LA
 for linux-arm-kernel@lists.infradead.org; Sat, 28 Nov 2020 16:34:26 +0000
Received: by mail-pl1-x634.google.com with SMTP id k5so4146483plt.6
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 28 Nov 2020 08:34:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wc0nyS8dzfOavbOXrqC7eni+mcCu2FOMeKW4jeT7vyw=;
 b=j947Wy9p0q+rAUjgkMm8kdMwwdNbzshmIu7FSEn/IDz8zavpWSpLXmKD5VsTgRV2iY
 fb43v4xzcP/oEWoPzuvBd2TYhPmsNWNBMSD+YN+PIibF/+rbDKwFGK3Gt4BFgc5fUqRe
 dmh4z1bASeUI49SAfrKupeFSTVxuFsL50Ir+V9LcQxs8Qyj78CF1neVlgYG9rWtsfklf
 EmeF+5aaAWw6LGem+LbpVkSxpvEzUDWvGC/1HRupC34lNBXA1V2HwC+XINP3N7fzZVB+
 kKyt12yNVR4IiWDAozr2JeDhNTe3C/aywEBQrD++ahGF1rrANka/KYQHOn2AJf1bDUVx
 wjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wc0nyS8dzfOavbOXrqC7eni+mcCu2FOMeKW4jeT7vyw=;
 b=dDSJRS7x/aD0SdfjzXHUYaNXtHi9zgaeb8c6dCBo3KYnZDFRU9/xnAD6XcbGhBgtkz
 ugjNMrXWk10AvoRhUQyFDAMl26TNH0HpUO8lZwAFHvLof86G3npF3jxTk4VwiajBmMh9
 mCYqrjBa2nxX2D5Hr7YiNYZQk4ZTQV72On8QlhY/N6/1kbYWxqdFH+MnEnje+GNsI7QO
 MGsQ1bY9l4iP+u+bP1WJDNcTJYNYbuqONSnDXqisRVIj9yY6NgE/B888gaDhXjL4AXF+
 a4x5sadIbjKYKi3B7LKpPOVeJglc3+ETiklWnTntXmsB35e6NhM3b8dYVYxvbuSNPvwx
 DiJA==
X-Gm-Message-State: AOAM530kF7lBOCSXOuKKkLdK6Ao6fOv2ZSCz4C0CB33zRStFyq3xhRpv
 lONQFXam5dIkOVwBjFmH6yo=
X-Google-Smtp-Source: ABdhPJzukg0n15WSZduzQOD6MIK+fRpeh6hDf9gLa77zVnqELS2lAC2JfcamQIDpFo/ea7FlCnCrsQ==
X-Received: by 2002:a17:902:bb8b:b029:da:beb:b81e with SMTP id
 m11-20020a170902bb8bb02900da0bebb81emr11855775pls.44.1606581261175; 
 Sat, 28 Nov 2020 08:34:21 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id c3sm10909209pfn.67.2020.11.28.08.34.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 08:34:20 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 4/5] Broadcom devicetree-arm64 changes for 5.11
Date: Sat, 28 Nov 2020 08:34:09 -0800
Message-ID: <20201128163410.1691529-4-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201128163410.1691529-1-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_113423_883393_B9806040 
X-CRM114-Status: GOOD (  12.97  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de, khilman@kernel.org,
 olof@lixom.net, bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201128163409.8c0zSSITGXmnYMVweho4y2RfOc0sCRmdmBBjrwZsloY@z>

VGhlIGZvbGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCAzNjUwYjIyOGY4M2FkZGE3ZTVlZTUz
MmUyYjkwNDI5YzAzZjdiOWVjOgoKICBMaW51eCA1LjEwLXJjMSAoMjAyMC0xMC0yNSAxNToxNDox
MSAtMDcwMCkKCmFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0OgoKICBodHRw
czovL2dpdGh1Yi5jb20vQnJvYWRjb20vc3RibGludXguZ2l0IHRhZ3MvYXJtLXNvYy9mb3ItNS4x
MS9kZXZpY2V0cmVlLWFybTY0Cgpmb3IgeW91IHRvIGZldGNoIGNoYW5nZXMgdXAgdG8gZGNjYjIy
ZDA3OGViZDA5ODExNWU0ZjY2YmRlMWVlMjI0OWM4NjQwYjoKCiAgYXJtNjQ6IGFkZCBjb25maWcg
Zm9yIEJyb2FkY29tIEJDTTQ5MDggU29DcyAoMjAyMC0xMS0yNSAwOTowNzo0OSAtMDgwMCkKCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KVGhpcyBwdWxsIHJlcXVlc3QgY29udGFpbnMgQnJvYWRjb20gQVJNNjQtYmFzZWQgU29D
cyBEZXZpY2UgVHJlZSBjaGFuZ2VzCmZvciA1LjExLCBwbGVhc2UgcHVsbCB0aGUgZm9sbG93aW5n
OgoKLSBSYWZhbCBhZGRzIGluaXRpYWwgc3VwcG9ydCBmb3IgdGhlIEJyb2FkY29tIDQ5MDggd2hp
Y2ggYXJlIFNvQ3MgdXNlZAogIGluIGhvbWUgcm91dGVycyBhbmQgYXJlIGJhc2VkIG9uIHRoZSBE
U0wgYXJjaGl0ZWN0dXJlIGFuZCB1c2luZwogIEJyb2FkY29tIEJyYWhtYS1CNTMgQ1BVcy4KCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0KUmFmYcWCIE1pxYJlY2tpICgzKToKICAgICAgZHQtYmluZGluZ3M6IGFybTogYmNtOiBk
b2N1bWVudCBCQ000OTA4IGJpbmRpbmdzCiAgICAgIGFybTY0OiBkdHM6IGJyb2FkY29tOiBhZGQg
QkNNNDkwOCBhbmQgQXN1cyBHVC1BQzUzMDAgZWFybHkgRFRTIGZpbGVzCiAgICAgIGFybTY0OiBh
ZGQgY29uZmlnIGZvciBCcm9hZGNvbSBCQ000OTA4IFNvQ3MKCiAuLi4vZGV2aWNldHJlZS9iaW5k
aW5ncy9hcm0vYmNtL2JyY20sYmNtNDkwOC55YW1sICB8ICAzOCArKysrKwogYXJjaC9hcm02NC9L
Y29uZmlnLnBsYXRmb3JtcyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKwogYXJjaC9hcm02
NC9ib290L2R0cy9icm9hZGNvbS9NYWtlZmlsZSAgICAgICAgICAgICAgfCAgIDEgKwogYXJjaC9h
cm02NC9ib290L2R0cy9icm9hZGNvbS9iY200OTA4L01ha2VmaWxlICAgICAgfCAgIDIgKwogLi4u
L2Jyb2FkY29tL2JjbTQ5MDgvYmNtNDkwOC1hc3VzLWd0LWFjNTMwMC5kdHMgICAgfCAgNjYgKysr
KysrKysKIGFyY2gvYXJtNjQvYm9vdC9kdHMvYnJvYWRjb20vYmNtNDkwOC9iY200OTA4LmR0c2kg
IHwgMTg3ICsrKysrKysrKysrKysrKysrKysrKwogYXJjaC9hcm02NC9jb25maWdzL2RlZmNvbmZp
ZyAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKwogNyBmaWxlcyBjaGFuZ2VkLCAzMDMgaW5z
ZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vYmNtL2JyY20sYmNtNDkwOC55YW1sCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJj
aC9hcm02NC9ib290L2R0cy9icm9hZGNvbS9iY200OTA4L01ha2VmaWxlCiBjcmVhdGUgbW9kZSAx
MDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9icm9hZGNvbS9iY200OTA4L2JjbTQ5MDgtYXN1cy1n
dC1hYzUzMDAuZHRzCiBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9hcm02NC9ib290L2R0cy9icm9h
ZGNvbS9iY200OTA4L2JjbTQ5MDguZHRzaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYXJtLWtlcm5lbCBtYWlsaW5nIGxpc3QKbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtYXJtLWtlcm5lbAo=
