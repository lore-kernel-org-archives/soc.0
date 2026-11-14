Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794627967;
	b=sQU6XdDtd1NQDMINsTS5T+TZVxC3TW1A5IR5oSmwewh2O1V/Q9U52Bskf4Vy0hUSDQRR
	 oSK6E/8ZRcIcnUNAdQJTsArTwW3iqGuBfVUHRieTByb2/xE9r/Z25eXDUMQVge6P1gGxr
	 TPJgDGrdYy0TexiQtbWD8s/6+nh0yDkA8MZFS2Yr1xrNwuSl+JBs9U7LlA8/DyB3w7q5O
	 cULDWewOyc3odWZ1rWO0RmRYT8KA0efpq3VlcIKY846b3yzvSCKzXssAngHTX6VanBn87
	 URbgU9lb6Oin2BPCn8ocqWnqdHY9ex5XW4DOd/+E7pUcZtptgyBBk+TBtIkl4emvCTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627967;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:DKIM-Signature:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SJl0hUkZqXVApHX3JrLhyWzcJTsIXQcZFhtyiqalu2o=;
	b=OCsNz87QTfsxUKduVvMduReSss1h9STgGJdDEgucwIUkSPDAvO28ZSyOp/1l5FcwFymN
	 ATh3/77q5nfrHPzReOpaxKAawT0k/CX0RcxSaukSLgsrP7ZelSlaVSzpuSfbGISOx5Inl
	 PTVjmTLGDUz9bo4xkGUEP2mZH9+DxOsQ6TGin5pmEwP2B1rxGrN2kHItU2F80y5W+/WYb
	 X4/k/OzAQls9mvVHtKGumE74jYllauXHp7Cn0lCOyLTdSQYSV2UFj1Vg234whAeMkq1M/
	 nwB3TkaPFEvIbV28gkOVwQXyWfrzfkfoKI4YS9sttA/Gd5Nehi+PZVh22RtwN3sOWAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z7ahkKtl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50407606A32D
	for <soc@lists.linux.dev>; Sat, 14 Nov 2026 03:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z7ahkKtl
Received: by smtp.kernel.org (Postfix)
	id 418471F000C4; Sat, 14 Nov 2026 03:46:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794627967;
	b=kAk9jcXBvUHN97HLHNk42ksZmvrq6wJR0XnEfi+79h/FmGSW439CMCfBuztialuKuco5
	 ArgWZa6SkC4tl4orI0i9/WTeWEA948QGL0TnpcRJzrjs+78iVqsfAP4UeF2bJrHNa8ZUR
	 nzDFYLSHbDXtelL0X9NqnMKZnN2wePVT0+XLxk6J8P8K+0V0CejEJxQdooRLOZGuiG6ua
	 XyFNS9GjwQmSUMB4qPEWL8KM3pYUxrDmyhg+I+6EdHxdZhT9ZWkurdxiX8sQpWA6PGPPa
	 IZd52VVK3sSANTfsk0yMk+DQswsDpK90Y7AwC9gtTLmCxoklxmOfMDQX2Cw7g7mki+g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794627967;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=SJl0hUkZqXVApHX3JrLhyWzcJTsIXQcZFhtyiqalu2o=;
	b=uxjSdyb2fobeqfiLcgccbgm3r211F8VAXZ+oFYYdFYkvS0vnP3fGBxlgtMndLWIt0/UB
	 kWDUg7uAzLyy+2RP9y1vJ9lZIVtB6pQGGm5r6nT9CcwxopX8cEIhJgZKBLLKkIdu0xJlZ
	 tWH5Y/rEQgLnul+xFZYwjrElUKYwx2wAT7D2T80kl45fKBzHPY9/cYidBwNis4SlD9y5w
	 /7QuBR7x7JY5hEotQNwaQyBkedVZlRkqpElu+Z6NmL9q5RI0R6IpcNqSj/o1raWoSr9Ys
	 Ndlo17gNG41Pr2m2LNdkCb2OkMs0JrPiejtMOu4fdroQ1sG9AbTGVc3+Zwlfok9nYPg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z7ahkKtl;
	dmarc=fail header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 489C71F000C8
	for <soc@kernel.org>; Sat, 14 Nov 2026 03:46:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Z7ahkKtl
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 489C71F000C8
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so872160a91.1
        for <soc@kernel.org>; Fri, 13 Nov 2026 19:46:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627965; x=1795232765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SJl0hUkZqXVApHX3JrLhyWzcJTsIXQcZFhtyiqalu2o=;
        b=JDmS3QjxaUQRBHiv4UV2WOM71Vw2ewdpMiUfG9aiac9LDHwWRe3Oi6b8VYlbgnVEhP
         OppumdsyUrcW6H6MVK4SJzARfH91O48OiByRxKlBDX3SGJDkc6gWS8wHBr4xZgx4Ws+l
         LxMxrTPqhCpS5onbtybS/yuYgvpmcHJG1V5Z1e9rzYyzmmo2X2z6mdwXRYL+vE2pm3LF
         D+nWCLoIpICdSDSMWV7neDOU+yC5dhGDygVlXFxINBtCN79l0+4hrmEN/xe/ViNgjMEj
         M/10FJ6+O/hgfFowhOXQRKg9urLKE4nZj6gnKhcQ4J3N3+1Q4DOd1aiIzPMbh7VeOvtm
         R7uw==
X-Gm-Message-State: APuU4Z+ZIm85U2pkTEr5wfVtwQDOrquX4g531Px9coc1SYcJDgpwKAUv
	W0PFTbkHFqaCA0x6T4jd72XaceyH4TgS9i4yYniBf4G6E56uM+O9KVcXClBU1yK+bZ6ltL7nNgT
	y+OuNxbTEu7KZb2OhfT4MWA2O11bad3c2dcHTAUD0obKxoxJwgm3rhryfBjg+b59uH+ivI1dLRb
	NCgSh6lTIQgg1ZjSeDWwIwDC0+e0ey04O/L1xO11HENWRPUH/euL23u8AMiZRsjJmlnVJZymXq0
	z7i2Q==
X-Gm-Gg: AYBFou2QqjUxkhuyG4fDcg7Z/gDO+6uO+use1DdhzYHprKFBdfYYH6F3jkPENZP6BcB
	zBHqT9m/5B3CaKTZ5AQo+4lQCLekwAkJCLX9Ogsm1SirGYWTL8dCybrcj4eOqmk5YdAlcQ+20W/
	A49n64O0FOHSzUNpRcQYfYay4GWtSaJSNDl05AH9dFD0vfNMwWF54xY8TzX1hM0J7EtrN4yNUEc
	LW6q58WGyL2weYaAUWE6JSM2aGwrzVkQ3/0Y7t/JrL6k6PBj2zZYLV4FORQkI5+Ih2Luy73vrBt
	CpM49F56bDLHF3DQ/5efSKe6BWk9kfiCbmhxi7X3EqLYNj4n8ZrNkCz5fMO21J4ZtSzxl+P1JnB
	QN9tSw9KeMTlFVKoFeOSHY1Lpky+Fxz/GVNurtsqM2x40O9NkpbcRoI0+Do4zMhGtcRqZHN+fEf
	CXfuwzlhYhyq71MtfX54mLHiiqjJmTEpWa2Cw6+WAoDDY=
X-Received: by 2002:a17:90b:3d8d:b0:3ac:97bc:4c98 with SMTP id 98e67ed59e1d1-3b1b0cc8f5emr4199052a91.64.1794627965500;
        Fri, 13 Nov 2026 19:46:05 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-121.dlp.protect.broadcom.com. [144.49.247.121])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae96f054sm6629197a91.3.2026.11.13.19.46.05
        for <soc@kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2026 19:46:05 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91eb05c8241so32517376d6.1
        for <soc@kernel.org>; Fri, 13 Nov 2026 19:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794627964; x=1795232764; darn=kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SJl0hUkZqXVApHX3JrLhyWzcJTsIXQcZFhtyiqalu2o=;
        b=Z7ahkKtlxCZQgR4UcRtMIpyJjvqpnhw1elczIShtkJnJUz6PgT3Y42S455Y2jdPNnx
         65tpubmFYreKllRQxCkDeiaijptr8zIrNCsrr6gpiJrHUPuUIHoSaGPzyUnbyn6XokRF
         k9GPBperYaGkK1Qw1+98ict6s5giNlHZmFLlQ=
X-Received: by 2002:ad4:5961:0:b0:91e:9074:19da with SMTP id 6a1803df08f44-91f241b8f9bmr70687736d6.22.1794627964215;
        Fri, 13 Nov 2026 19:46:04 -0800 (PST)
X-Received: by 2002:ad4:5961:0:b0:91e:9074:19da with SMTP id 6a1803df08f44-91f241b8f9bmr70687556d6.22.1794627963833;
        Fri, 13 Nov 2026 19:46:03 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d453casm34694466d6.10.2026.11.13.19.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:46:03 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: soc@kernel.org
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	khilman@kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 2/2] Broadcom maintainers fixes for 7.4
Date: Fri, 13 Nov 2026 19:45:50 -0800
Message-ID: <20261114034550.878760-2-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261114034550.878760-1-florian.fainelli@broadcom.com>
References: <20261114034550.878760-1-florian.fainelli@broadcom.com>
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-7.4/maintainers-fixes

for you to fetch changes up to f172beb64c26e2f4f3a1e7e92e6e710241a29c1e:

  MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com (2026-11-13 10:18:38 -0800)

----------------------------------------------------------------
This pull request contains MAINTAINERS file updates for Broadcom SoCs,
please pull the following:

- Jiri corrects Ray and Scott's addresses to use the current format
  since the older format has stopped working

----------------------------------------------------------------
Jiri Slaby (1):
      MAINTAINERS: fix bouncing {sbranden,rjui}@broadcom.com

 MAINTAINERS | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
